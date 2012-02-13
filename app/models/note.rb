class Note
  include Curator::Model
  include ActiveModel::Validations
  attr_accessor :id, :title, :description, :user_id

  validates :title, :presence => true
end
