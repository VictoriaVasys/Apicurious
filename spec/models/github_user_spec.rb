require 'rails_helper'

describe GithubUser do
  describe '#find_by' do
    it 'finds a github user by their access token' do
      user = GithubUser.find_by(ENV['GITHUB_USER_TOKEN'])
      
      expect(user.class).to eq(GithubUser)
      expect(user.name).to eq("Victoria Vasys")
      expect(user.login).to eq("VictoriaVasys")
      expect(user.avatar_url).to eq("https://avatars3.githubusercontent.com/u/10079657?v=3")
      expect(user.email).to eq("victoria.vasys@gmail.com")
      expect(user.id).to eq(10079657)
      expect(user.followers).to eq(1)
      expect(user.following).to eq(32)
    end
  end
end