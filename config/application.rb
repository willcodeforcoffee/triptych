require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Triptych
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Setup autoload paths
    config.x.autoload_paths = %W(
      #{Rails.root}/app/services/
    )
    config.autoload_paths += config.x.autoload_paths
    config.eager_load_paths += config.x.autoload_paths
  end
end
