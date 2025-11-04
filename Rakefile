# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

Rails.application.load_tasks


# Windows で cssbundling-rails の package manager 検出が失敗する問題の回避（test環境のみ）
if ENV["RAILS_ENV"] == "test"
  if Rake::Task.task_defined?("css:install")
    Rake::Task["css:install"].clear
    task "css:install" do
      sh "yarn install --check-files"
    end
  end

  if Rake::Task.task_defined?("css:build")
    Rake::Task["css:build"].clear
    task "css:build" do
      sh "yarn build:css"
    end
  end
end
# ...existing code...
