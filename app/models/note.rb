class Note
  include Librarian::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :id, :title, :description, :user_id

  def initialize(params = {})
    self.title = params[:title]
    self.description = params[:description]
    self.user_id = params[:user_id]
  end

  def persisted?
    id.present?
  end
end
