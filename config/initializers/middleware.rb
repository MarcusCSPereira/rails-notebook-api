require Rails.root.join("lib", "app_name")

unless Rails.env.test?
  Rails.application.config.middleware.use AppName, "Notebook API"
end
