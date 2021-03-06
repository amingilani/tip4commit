require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

# load config.yaml preprocessed
CONFIG ||= YAML::load(ERB.new(File.read("config/config.yml")).result)

# define default blockchain urls
merchant_url = "https://blockchain.info/merchant"
transfer_url = "https://blockchain.info/tx"
guid         = CONFIG["blockchain_info"]["guid"]
CONFIG["blockchain_info"]["merchant_url"] = merchant_url
CONFIG["blockchain_info"]["transfer_url"] = transfer_url
CONFIG["blockchain_info"]["new_url"]      = "#{merchant_url}/#{guid}/new_address"
CONFIG["blockchain_info"]["sendmany_url"] = "#{merchant_url}/#{guid}/sendmany"


module T4c
  class Application < Rails::Application

  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
  # config.time_zone = 'Central Time (US & Canada)'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
  # config.i18n.default_locale = :de

  config.autoload_paths += %W(#{config.root}/lib)
  config.assets.initialize_on_precompile = true
  config.available_locales = %w(en fr ru pl)
  end
end

I18n.enforce_available_locales = false
