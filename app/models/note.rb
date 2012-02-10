class Note
  include Librarian::Model
  attr_accessor :id, :title, :description, :user_id
end
