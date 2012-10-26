class NoteRepository
  include Curator::Repository

  indexed_fields :user_id

  def self.serialize(note)
    super.except('errors')
  end
end
