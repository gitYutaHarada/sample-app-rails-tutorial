# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

Rails.application.config.assets.paths << Rails.root.join("app/assets/builds")
Rails.application.config.assets.precompile += %w[ application.css application.js ]

# Add bootstrap-sass to asset paths
Rails.application.config.assets.paths << Gem.loaded_specs['bootstrap-sass'].full_gem_path + '/assets/stylesheets'
