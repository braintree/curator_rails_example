Curator.configure(:mongo) do |config|
  config.database = "curator_rails_example"
  config.environment = Rails.env
  config.migrations_path = Rails.root.join("db/migrate")
  config.mongo_config_file = Rails.root.join("config/mongo.yml")
end
