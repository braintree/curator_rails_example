class NotesController < ActionController::Base
  USER_ID = 1

  def index
    @notes = NoteRepository.find_by_user_id(USER_ID)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(request.POST[:note].merge(:user_id => USER_ID))
    if @note.valid?
      NoteRepository.save(@note)
      redirect_to notes_path
    else
      render :new
    end
  end

  def show
    @note = NoteRepository.find_by_id(params[:id])
  end
end
