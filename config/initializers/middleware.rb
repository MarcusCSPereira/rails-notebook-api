require Rails.root.join("lib", "app_name")

Rails.application.config.middleware.use AppName, "Notebook API"
