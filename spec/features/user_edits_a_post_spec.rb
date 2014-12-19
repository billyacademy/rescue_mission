require 'rails_helper'

feature "user edits a post", %q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates} do

    # Acceptance Criteria
    #
    # - I must provide valid information
    # - I must be presented with errors if I fill out the form incorrectly
    # - I must be able to get to the edit page from the question details page

    scenario "edits a post" do

      visit '/posts/new'

      fill_in "Title", with: "This is a post with a title more than forty characters, I think............"
      fill_in "Description", with: "Description is too short (minimum is 150 characters)
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words "

      click_on "Submit"

      visit '/posts'

      click_on "Edit"

      fill_in "Title", with: "This is a post with a title more than forty characters, I think............(revised)"

      fill_in "Description", with: "Description is too short (minimum is 150 characters)
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds "

      click_button "Save Post"

      expect(page).to_not have_content("Description is too short (minimum is 150 characters)
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words
      words words words words words words words words words words words words words words words words ")

      expect(page).to have_content("This is a post with a title more than forty characters, I think............(revised)")

      expect(page).to have_content("Description is too short (minimum is 150 characters)
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds
      birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds birds ")

      expect(page).to have_content("You have successfully edited a post.")
    end

  end
