require 'rails_helper'
feature "user views details of a post", %q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question} do
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description}

  it "user views details of a post" do
    visit '/posts/new'
    fill_in "Title", with: "rspec help tenletters tenletters tenletters
    tenletters"
    fill_in "Description", with: "This is a really complicated problem words
    words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words "
    click_on "Submit"
    visit '/posts'
    click_on "View"
    expect(page).to have_content "rspec help tenletters tenletters tenletters
    tenletters"
    expect(page).to have_content "This is a really complicated problem words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words
    words "
  end
end
