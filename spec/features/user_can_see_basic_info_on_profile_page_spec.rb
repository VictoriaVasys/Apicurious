require 'rails_helper'

feature "user logs in" do
  attr_reader :user, :gh_user
  before do
    @gh_user = stub_github_user
    allow_any_instance_of(GithubService)
      .to receive(:find_user)
      .and_return(@gh_user)
    stub_oauth
    visit root_path
    click_link 'Sign in with GitHub'
  end
  
  scenario "and sees their name" do
    expect(page).to have_content "#{gh_user[:name]}"
  end
  
  scenario "and sees their profie pic" do
    expect(page).to have_css "img[src*='#{gh_user[:image_url]}']"
  end
  
  scenario "and sees their number of starred repos" do
    expect(page).to have_content "Stars 3"
  end
  
  scenario "and sees their number of followers" do
    expect(page).to have_content "Followers #{gh_user[:followers]}"
  end
  
  scenario "and sees the number of people who they're following" do
    expect(page).to have_content "Following #{gh_user[:following]}"
  end
  
  scenario "and sees their bio" do
    expect(page).to have_content "#{gh_user[:bio]}"
  end
  
  scenario "and sees their company" do
    expect(page).to have_content "#{gh_user[:company]}"
  end
  
  scenario "and sees their current city" do
    expect(page).to have_content "#{gh_user[:location]}"
  end
  
  scenario "and sees their email" do
    expect(page).to have_content "#{gh_user[:email]}"
  end
  
end