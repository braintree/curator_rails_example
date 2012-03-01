# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each {|f| require f}

Curator.configure(:resettable_riak) do |config|
  config.bucket_prefix = 'curator_rails_example'
  config.environment = 'test'
  config.migrations_path = Rails.root.join('db/migrate')
  config.riak_config_file = Rails.root.join('config/riak.yml')
end

RSpec.configure do |config|
  config.before(:suite) do
    Curator.data_store.remove_all_keys
  end

  config.after(:each) do
    Curator.data_store.reset!
  end

  config.infer_base_class_for_anonymous_controllers = false
end
