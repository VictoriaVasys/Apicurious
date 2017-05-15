class Dashboard::FollowersController < ApplicationController
  
  def index
    @user = GithubUser.find_by(current_user.token)
  end
  
end