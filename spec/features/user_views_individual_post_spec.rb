require 'rails_helper'

feature "user views details of a post", %q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question

  Acceptance Criteria

  - I must be able to get to this page from the questions index
  - I must see the question's title
  - I must see the question's description} do

  it "user views details of a post" do

      visit '/posts/new'

      fill_in "Title", with: "rspec help"
      fill_in "Description", with: "This is a really complicated problem"

      click_on "Submit"

      visit '/posts/new'

      fill_in "Title", with: "What time is it?"
      fill_in "Description", with: "It's dinner time!"

      click_on "Submit"

      visit '/posts/new'

      fill_in "Title", with: "Can I have some help?"
      fill_in "Description", with: "We are out to lunch"

      click_on "Submit"

      visit '/posts'

      click_on "rspec help"



     expect(page).to have_content "rspec help"
     expect(page).to have_content "This is a really complicated problem"


    end
  end
