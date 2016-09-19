require 'rails_helper'

RSpec.feature "User can search by ingredient", type: :feature do
  scenario "they can see search results" do

    visit root_path
    fill_in "search", with: "1 large apple"
    click_on "Search"

    expect(page).to have_content("Calories")
  end
end
