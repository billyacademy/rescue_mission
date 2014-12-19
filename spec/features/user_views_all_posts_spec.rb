require 'rails_helper'

feature "user views all posts", %q{As a user
I want to view recently posted questions
So that I can help others

#Acceptance Criteria

- I must see the title of each question
- I must see questions listed in order, most recently posted first} do

  it "view all posts" do

    visit '/posts/new'

    fill_in "Title", with: "rspec help tenletters tenletters tenletters tenletters"
    fill_in "Description", with: "This is a really complicated problem words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words "

    click_on "Submit"

    visit '/posts/new'

    fill_in "Title", with: "What time is it? tenletters tenletters tenletters tenletters"
    fill_in "Description", with: "It's dinner time! words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words "

    click_on "Submit"

    visit '/posts/new'

    fill_in "Title", with: "Can I have some help? tenletters tenletters tenletters"
    fill_in "Description", with: "We are out to lunch  words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words
    words words words words words words words words words words words words words words
    words words words words words words words words words words words words "

    click_on "Submit"

    visit '/posts'

    expect(page).to have_content "rspec help tenletters tenletters tenletters tenletters"
    expect(page).to have_content "What time is it? tenletters tenletters tenletters tenletters"
    expect(page).to have_content "Can I have some help? tenletters tenletters tenletters"
    page.text.index("What time is it? tenletters tenletters tenletters tenletters") > page.text.index("Can I have some help? tenletters tenletters tenletters" )
  end


end
