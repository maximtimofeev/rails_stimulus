require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStimulus
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("app", "views", "components")
    config.view_component.preview_paths << Rails.root.join("app", "views", "components")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    config.view_component.view_component_path = "app/views/components"
    config.eager_load_paths << Rails.root.join("app/views/components")

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    initializer "app_assets", after: "importmap.assets" do
      Rails.application.config.assets.paths << Rails.root.join('app/views') # for component sidecar js
    end
    config.importmap.cache_sweepers << Rails.root.join('app/views/components')
  end
end
