require 'rails_helper'

describe GithubService do
  
  scenario "finds a raw github user" do
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