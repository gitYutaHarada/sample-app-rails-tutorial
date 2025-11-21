# frozen_string_literal: true

return unless defined?(Rails)

namespace :db do
  desc "Terminate existing PostgreSQL connections for the current environment"
  task :terminate_connections do
    configs = ActiveRecord::Base.configurations

    db_config =
      if configs.respond_to?(:find_db_config)
        configs.find_db_config(Rails.env)
      elsif configs.respond_to?(:configs_for)
        configs.configs_for(env_name: Rails.env).first
      else
        configs[Rails.env]
      end

    unless db_config
      puts "No database configuration found for #{Rails.env}; skipping connection termination."
      next
    end

    connection_hash =
      if db_config.respond_to?(:configuration_hash)
        db_config.configuration_hash
      else
        db_config
      end

    connection_hash = connection_hash.transform_keys(&:to_s)
    adapter = connection_hash["adapter"]

    unless adapter&.include?("postgres")
      puts "Adapter '#{adapter}' does not support connection termination hook; skipping."
      next
    end

    require "pg"

    db_name = connection_hash["database"]
    params = {
      host: connection_hash["host"],
      port: connection_hash["port"],
      user: connection_hash["username"] || connection_hash["user"],
      password: connection_hash["password"],
      dbname: "postgres"
    }.compact

    puts "Terminating active PostgreSQL sessions for '#{db_name}'..."

    conn = PG.connect(params)
    conn.exec_params(<<~SQL, [ db_name ])
      SELECT pg_terminate_backend(pid)
      FROM pg_stat_activity
      WHERE datname = $1 AND pid <> pg_backend_pid();
    SQL
    conn.close
  rescue PG::Error => e
    warn "Failed to terminate PostgreSQL sessions: #{e.message}"
  end
end

%w[drop drop:_unsafe drop:all].each do |task_name|
  full_name = "db:#{task_name}"
  next unless Rake::Task.task_defined?(full_name)

  Rake::Task[full_name].enhance([ "db:terminate_connections" ])
end
