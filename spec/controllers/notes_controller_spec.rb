require 'spec_helper'

describe NotesController do
  describe "index" do
    it "assigns all notes" do
      note1 = Note.new(:name => "one", :user_id => NotesController::USER_ID)
      note2 = Note.new(:name => "two", :user_id => NotesController::USER_ID)

      NoteRepository.save(note1)
      NoteRepository.save(note2)

      get :index

      assigns(:notes).sort_by(&:id).should == [note1, note2].sort_by(&:id)
    end
  end
end
