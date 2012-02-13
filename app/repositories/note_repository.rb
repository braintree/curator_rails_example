class NoteRepository
  include Curator::Repository

  indexed_fields :user_id
end
