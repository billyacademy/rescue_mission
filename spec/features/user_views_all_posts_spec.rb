require 'rails_helper'

feature "user views all posts", %q{As a user
I want to view recently posted questions
So that I can help others

#Acceptance Criteria

- I must see the title of each question
- I must see questions listed in order, most recently posted first} do

  it "view all posts" do

    visit '/posts'

    expect(page).to have_content "what doth"
    expect(page).to have_content "WORK IT"

  end
end
