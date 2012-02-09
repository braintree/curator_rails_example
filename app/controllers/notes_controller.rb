class NotesController < ActionController::Base
  USER_ID = 1

  def index
    @notes = NoteRepository.find_by_user_id(USER_ID)
  end

  def new
    @note = Note.new
  end

  def create
    note = Note.new(request.POST[:note].merge(:user_id => USER_ID))
    NoteRepository.save(note)
    redirect_to notes_path
  end

  def show
    @note = NoteRepository.find_by_id(params[:id])
  end
end
