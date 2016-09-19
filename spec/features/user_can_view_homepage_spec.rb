require 'rails_helper'

RSpec.feature "Guest User Can View Home Page", type: :feature do
  scenario "they can see an option to login" do

    visit root_path
    
    expect(page).to have_content("Login")
  end
end
