require 'spec_helper'
require Rails.root.join('db/migrate/notes/0001_update_description')

describe UpdateDescription do
  describe "migrate" do
    it "ammends the description" do
      hash = {:description => "blah"}
      UpdateDescription.new(1).migrate(hash)[:description].should == "blah -- Passed through migration 1"
    end
  end
end
