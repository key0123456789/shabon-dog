require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ShabonDog
  class Application < Rails::Application
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.time_zone_aware_types = [:datetime, :time]
  end
end
