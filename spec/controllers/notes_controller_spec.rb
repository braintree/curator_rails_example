require 'spec_helper'

describe NotesController do
  describe "index" do
    it "assigns all notes" do
      note1 = Note.new(:title => "one", :user_id => NotesController::USER_ID)
      note2 = Note.new(:title => "two", :user_id => NotesController::USER_ID)

      NoteRepository.save(note1)
      NoteRepository.save(note2)

      get :index

      assigns(:notes).map { |n| n.id.to_s}.sort.should == [note1, note2].map { |n| n.id.to_s}.sort
    end
  end

  describe "create" do
    it "creates a note" do
      post :create, :note => {:title => "some_name", :description => "blah blah", :version => 1}

      notes = NoteRepository.find_by_user_id(NotesController::USER_ID)
      notes.size.should == 1

      notes.first.title.should == "some_name"
      notes.first.description.should == "blah blah"
    end
  end
end
