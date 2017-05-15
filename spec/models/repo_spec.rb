require 'rails_helper'

describe "repo" do
  let(:token) {ENV['GITHUB_USER_TOKEN']}
  let(:user) {GithubUser.find_by(token)}
  context "create repos" do
    it "can create repos from raw data" do
      VCR.use_cassette("repos") do
        repos = user.repos

        expect(repos).to be_an(Array)
        expect(repos.first).to be_a(Repo)
        expect(repos.count).to eq(35)
      end
    end

    it "can create starred repos from raw data" do
      VCR.use_cassette("starred") do
        stars = user.starred

        expect(stars).to be_an(Array)
        expect(stars.first).to be_a(Repo)
        expect(stars.count).to eq(3)
      end
    end
  end

end