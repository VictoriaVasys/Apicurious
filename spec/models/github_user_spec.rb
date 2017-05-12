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
        expect(user.following_count).to eq(32)
      end
    end
  end
  
  describe '#starred' do
    it "finds number of starred repos" do
      starred = user.starred(token)

      expect(starred).to be_an(Array)
      expect(starred.count).to eq(3)
    end
  end
  
end