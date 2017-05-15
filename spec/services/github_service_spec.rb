require 'rails_helper'

describe GithubService do
  
  scenario "finds a raw github user" do
    VCR.use_cassette("github_service_search_user") do
      user = GithubService.new(ENV['GITHUB_USER_TOKEN']).find_user
      
      expect(user).to be_a(Hash)
      expect(user).to have_key(:name)
      expect(user).to have_key(:login)
      expect(user).to have_key(:avatar_url)
      expect(user).to have_key(:email)
      expect(user).to have_key(:id)
      expect(user).to have_key(:followers)
      expect(user).to have_key(:following)
      expect(user[:name]).to be_a(String)
      expect(user[:login]).to be_a(String)
      expect(user[:avatar_url]).to be_a(String)
      expect(user[:email]).to be_a(String)
      expect(user[:id]).to be_an(Integer)
      expect(user[:followers]).to be_an(Integer)
      expect(user[:following]).to be_an(Integer)
    end
  end
  
  context "starred" do
    it "finds user's starred repos" do
      VCR.use_cassette("github_service_starred") do
        token = ENV['GITHUB_USER_TOKEN']
        starred = GithubService.new(token).starred

        expect(starred).to be_an(Array)
      end
    end
  end
  
  context "followers" do
    it "finds user's followers" do
      VCR.use_cassette("github_service_followers") do
        token = ENV['GITHUB_USER_TOKEN']
        followers = GithubService.new(token).followers

        expect(followers).to be_an(Array)
        expect(followers.first).to be_a(Hash)
      end
    end
  end

  context "following" do
    it "finds user's following" do
      VCR.use_cassette("github_service_following") do
        token = ENV['GITHUB_USER_TOKEN']
        following = GithubService.new(token).following

        expect(following).to be_an(Array)
        expect(following.first).to be_a(Hash)
      end
    end
  end

  context "repos" do
    it "finds user's repositories" do
      VCR.use_cassette("github_service_repos") do
        token = ENV['GITHUB_USER_TOKEN']
        repos = GithubService.new(token).repos
  
        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Hash)
      end
    end
  end
  
end