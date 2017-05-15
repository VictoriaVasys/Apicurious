require 'rails_helper'

describe GithubUser do
  let(:token) {ENV['GITHUB_USER_TOKEN']}
  let(:user) {GithubUser.find_by(token)}
  describe '#find_by' do
    it 'finds a github user by their access token' do
      VCR.use_cassette("github_user") do
        expect(user.class).to eq(GithubUser)
        expect(user.name).to eq("Victoria Vasys")
        expect(user.username).to eq("VictoriaVasys")
        expect(user.image_url).to eq("https://avatars3.githubusercontent.com/u/10079657?v=3")
        expect(user.email).to eq("victoria.vasys@gmail.com")
        expect(user.followers_count).to eq(2)
        expect(user.following_count).to eq(33)
      end
    end
  end
  
  describe '#starred' do
    it "finds number of starred repos" do
      VCR.use_cassette("github_user_starred") do
        starred = user.starred

        expect(starred).to be_an(Array)
        expect(starred.first).to be_a(Repo)
        expect(starred.count).to eq(3)
      end
    end
  end
  
  describe '#followers' do
    it "can find followers" do
      VCR.use_cassette("github_user_followers") do
        followers = user.followers

        expect(followers).to be_an(Array)
        expect(followers.count).to eq(2)
        expect(followers.first.username).to eq("stovermc")
      end
    end
  end

  describe '#following' do
    it "can find following" do
      VCR.use_cassette("github_user_following") do
        following = user.following

        expect(following).to be_an(Array)
        expect(following.count).to eq(30)
        expect(following.first.username).to eq("jasonnoble")
      end
    end
  end

  describe '#repos' do
    it "can find all repos" do
      VCR.use_cassette("github_user_repos") do
        repos = user.repos

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Repo)
        expect(repos.count).to eq(35)
      end
    end
  end
  
end