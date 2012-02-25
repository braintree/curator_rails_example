class UpdateDescription < Curator::Migration
  def migrate(attributes)
    attributes.merge(:description => attributes[:description] + " -- Passed through migration 1")
  end
end
