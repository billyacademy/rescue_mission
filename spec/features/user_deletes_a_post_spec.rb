require 'rails_helper'

feature "user deletes a post", %q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions} do

  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted

scenario "deletes a post" do

  visit '/posts/new'

  fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
  fill_in "Description", with: "Description is too short (minimum is 150 characters)
  words words words words words words words words words words words words words words words
  words words words words words words words words words words words words words words words
  words words words words words words words words words words words words words words words words
  words words words words words words words words words words words words words words words words "

  click_on "Submit"

  fill_in "Message", with: "That's a really good point Chan, you killin it right now but I have one recommendation
  going forward, gimme my money."

  click_on "Submit"

  click_on "Destroy Comment"

  expect(page).to_not have_content("That's a really good point Chan, you killin it right now but I have one recommendation
  going forward, gimme my money.")

  end

end
