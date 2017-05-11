require 'rails_helper'

feature "user logs in" do
  before do
    stub_oauth
    visit '/'
    click_link 'Sign in with GitHub'
  end
  
  scenario "and sees their name" do
    expect(page).to have_content "Victoria V"
  end
  
  scenario "and sees their profie pic" do
    expect(page).to have_css "img[src*='https://avatars3.githubusercontent.com/u/10079657?v=3']"
  end
  
  scenario "and sees their number of starred repos" do
    expect(page).to have_content "Stars 3"
  end
  
  scenario "and sees their number of followers" do
    expect(page).to have_content "Followers 2"
  end
  
  scenario "and sees the number of people who they're following" do
    expect(page).to have_content "Following 32"
  end
  
end