require 'rails_helper'

feature "User can see collection lists" do
  
  before do
    stub_oauth

    visit root_path
    click_link "Sign in with GitHub"
  end
  
  context "Starred" do
    context "starting on basic profile" do
      scenario "user can navigate to starred path" do
        click_link "Stars"
        
        expect(current_path).to eq(dashboard_starred_path)
      end
    end
    
    context "starting on starred path" do
      scenario "user can view all the users they're starred" do
        allow_any_instance_of(GithubService)
        .to receive(:starred)
        .and_return(stub_repos)
        visit dashboard_starred_path
        
        within(".repo_0") do
          expect(page).to have_content("bschwartz10/superpower_shop")
          expect(page).to have_content("CSS")
        end
        
        within(".repo_1") do
          expect(page).to have_content("VictoriaVasys/rales_engine")
          expect(page).to have_content("This is our first Turing School Mod 3 project")
          expect(page).to have_content("Ruby")
        end
        
        expect(page).to_not have_css(".repo_3")
      end
    end
  end
  
  context "Followers" do
    context "starting on basic profile" do
      scenario "user can navigate to followers path" do
        click_link "Followers"

        expect(current_path).to eq(dashboard_followers_path)
      end
    end
  
    context "starting on followers path" do
      scenario "user can view all their followers" do
        allow_any_instance_of(GithubService)
          .to receive(:followers)
          .and_return(stub_github_user_collection)
        visit dashboard_followers_path

        within(".user_1") do
          expect(page).to have_content("VictoriaVasys")
          expect(page).to have_css("img[src*='#{stub_github_user[:avatar_url]}']")
        end

        expect(page).to_not have_css(".user_3")
      end
    end
  end
  
  context "Following" do
    context "starting on basic profile" do
      scenario "user can navigate to following path" do
        click_link "Following"

        expect(current_path).to eq(dashboard_following_path)
      end
    end
  
    context "starting on following path" do
      scenario "user can view all the users they're following" do
        allow_any_instance_of(GithubService)
          .to receive(:following)
          .and_return(stub_github_user_collection)
        visit dashboard_following_path

        within(".user_1") do
          expect(page).to have_content("VictoriaVasys")
          expect(page).to have_css("img[src*='#{stub_github_user[:avatar_url]}']")
        end

        expect(page).to_not have_css(".user_3")
      end
    end
  end
  
  context "Repos" do
    context "starting on basic profile" do
      scenario "user can navigate to starred path" do
        click_link "Repositories"
        
        expect(current_path).to eq(dashboard_repos_path)
      end
    end
    
    context "starting on repos path" do
      scenario "user can view all the users they're repos" do
        allow_any_instance_of(GithubService)
        .to receive(:repos)
        .and_return(stub_repos)
        visit dashboard_repos_path
        
        within(".repo_0") do
          expect(page).to have_content("rales_engine")
          expect(page).to have_content("This is our first Turing School Mod 3 project")
          expect(page).to have_content("Ruby")
        end
        
        expect(page).to_not have_css(".repo_1")
      end
    end
  end
  
end
