require_relative "boot"

require "rails/all"
require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
Bundler.require(*Rails.groups)

module FinishProject
  class Application < Rails::Application
    config.load_defaults 6.1
    

    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru
  end
end
