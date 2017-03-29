# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ActionCableCrud
  class Application < Rails::Application
  end
end
