require 'rails_helper'

feature "User creats a post", %q{
  ```no-highlight
  As a user
  I want to post a question
  So that I can receive help from others} do

  #Acceptance Criteria

  # I must provide a title that is at least 40 characters long
  # I must provide a description that is at least 150 characters long
  # I must be presented with errors if I fill out the form incorrectly

# context "with valid attributes" do
  it "creates a post with valid attributes" do

    visit '/posts'

    expect(page).to have_content "this is where you post"
  end
end
