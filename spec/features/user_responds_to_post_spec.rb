require 'rails_helper'

feature "user responds to a post", %q{
As a user
I want to answer another user's question
So that I can help them solve their problem"} do

#Acceptance Criteria

#- I must be on the question detail page
#- I must provide a description that is at least 50 characters long
#- I must be presented with errors if I fill out the form incorrectly }


it "creates a response with valid attributes" do

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

    expect(page).to have_content "You have successfully submitted a response."
  end

  it "creates a response with invalid attributes" do

    visit '/posts/new'

    fill_in "Title", with: "This is a post with a title more than forty characters, I think..........."
    fill_in "Description", with: "Description is too short (minimum is 150 characters)
    words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words words
    words words words words words words words words words words words words words words words words "

    click_on "Submit"

    fill_in "Message", with: "That's a really good point Chany."

    click_on "Submit"

    expect(page).to have_content "Message is too short (minimum is 50 characters)"
  end

end
