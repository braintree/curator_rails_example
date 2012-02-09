class NoteRepository
  include Librarian::Repository

  indexed_fields :user_id
end
