require 'rails_helper'

feature "user logs in" do
  attr_reader :user
  before do
    stub_oauth
    visit '/'
    click_link 'Sign in with GitHub'
    @user = User.last
  end
  
  scenario "and sees their name" do
    expect(page).to have_content "#{user.name}"
  end
  
  scenario "and sees their profie pic" do
    expect(page).to have_css "img[src*='#{user.image_url}']"
  end
  
  scenario "and sees their number of starred repos" do
    expect(page).to have_content "Stars 3"
  end
  
  scenario "and sees their number of followers" do
    expect(page).to have_content "Followers 2"
  end
  
  scenario "and sees the number of people who they're following" do
    expect(page).to have_content "Following 33"
  end
  
  scenario "and sees their bio" do
    expect(page).to have_content "Back-End Engineering"
  end
  
  scenario "and sees their company" do
    expect(page).to have_content "@turingschool"
  end
  
  scenario "and sees their current city" do
    expect(page).to have_content "Denver, CO"
  end
  
  scenario "and sees their email" do
    expect(page).to have_content "victoria.vasys@gmail.com"
  end
  
end