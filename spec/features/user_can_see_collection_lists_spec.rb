require 'rails_helper'

feature "User can see collection lists" do
  
  before do
    stub_oauth

    visit root_path
    click_link "Sign in with GitHub"
  end
  
  context "Followers" do
    context "starting on basic profile" do
      scenario "user can navigate to followers path" do
        click_link "Followers"

        expect(current_path).to eq(followers_path)
      end
    end
  
    context "starting on followers path" do
      scenario "user can view all their followers" do
        allow_any_instance_of(GithubService)
          .to receive(:followers)
          .and_return(stub_github_user_collection)
        visit followers_path

        within(".user_1") do
          expect(page).to have_content("Victoria V")
          expect(page).to have_css("img[src*='#{stub_github_user[:avatar_url]}']")
        end

        expect(page).to_not have_css(".user_3")
      end
    end
  end
    
end
