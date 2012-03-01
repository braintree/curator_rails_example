class UpdateDescription < Curator::Migration
  def migrate(attributes)
    attributes.merge(:description => attributes[:description].to_s + " -- Passed through migration 1")
  end
end
