require 'rails_helper'

feature "user views all posts", %q{As a user
I want to view recently posted questions
So that I can help others

#Acceptance Criteria

- I must see the title of each question
- I must see questions listed in order, most recently posted first} do

  it "view all posts" do

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

    expect(page).to have_content "rspec help"
    expect(page).to have_content "Can I have some help?"
    expect(page).to have_content "What time is it?"

  end
end
