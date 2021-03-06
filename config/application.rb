require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mail
  class Application < Rails::Application

    # タイムゾーンの設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    # I18n設定
    config.i18n.default_locale = :ja
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
