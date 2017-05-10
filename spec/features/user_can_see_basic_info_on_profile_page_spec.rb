require 'rails_helper'

feature "user logs in" do
  before do
    stub_oauth
    visit '/'
    click_link 'Sign in with GitHub'
  end
  
  xscenario "and sees their name" do
    expect(page).to have_content "Victoria Vasys"
  end
  
  xscenario "and sees their number of starred repos" do
    expect(page).to have_content "Stars 3"
  end
  
  xscenario "and sees their followers" do
    expect(page).to have_content "Followers 1"
  end
  
  xscenario "and sees who they're following" do
    expect(page).to have_content "Following 31"
  end
  
  xscenario "and sees their profie pic" do
    expect(page).to have_content "https://avatars3.githubusercontent.com/u/10079657?v=3"
  end
end