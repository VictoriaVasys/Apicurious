require 'rails_helper'

feature "user logs in" do
  before do
    stubbed_response = {
      :login=>"VictoriaVasys",
      :id=>10079657,
      :avatar_url=>"https://avatars3.githubusercontent.com/u/10079657?v=3",
      :followers_url=>"https://api.github.com/users/VictoriaVasys/followers",
      :following_url=>"https://api.github.com/users/VictoriaVasys/following",
      :gists_url=>"https://api.github.com/users/VictoriaVasys/gists",
      :starred_url=>"https://api.github.com/users/VictoriaVasys/starred",
      :subscriptions_url=>"https://api.github.com/users/VictoriaVasys/subscriptions",
      :organizations_url=>"https://api.github.com/users/VictoriaVasys/orgs",
      :repos_url=>"https://api.github.com/users/VictoriaVasys/repos",
      :events_url=>"https://api.github.com/users/VictoriaVasys/events{/privacy}",
      :received_events_url=>"https://api.github.com/users/VictoriaVasys/received_events",
      :site_admin=>false,
      :name=>"Victoria Vasys",
      :company=>"@turingschool",
      :location=>"Denver, CO",
      :email=>"victoria.vasys@gmail.com",
      :bio=>"I'm a student in the Back-End Engineering Program at Turing School of Software & Design.",
      :public_repos=>35,
      :public_gists=>12,
      :followers=>2,
      :following=>32,
      :created_at=>"2014-12-04T21:03:00Z",
      :updated_at=>"2017-04-10T18:33:58Z"}
    allow_any_instance_of(GithubService)
      .to receive(:find_by)
      .with(filter)
      .and_return(stubbed_response)
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