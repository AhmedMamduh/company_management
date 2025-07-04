require_relative "boot"

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_cable/engine"

Bundler.require(*Rails.groups)

module CompanyManagement
  class Application < Rails::Application
    config.load_defaults 5.2

    config.active_job.queue_adapter = :sidekiq

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, key: '_company_management_session'

    config.api_only = true
  end
end
