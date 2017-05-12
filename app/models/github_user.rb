class GithubUser
  
  def initialize(attrs={}, token)
    @_attrs = attrs
    @_token = token
  end
  
  def self.find_by(token)
    user = GithubService.new(token).find_user
    new(user, token)
  end
  
  def name
    attrs[:name]
  end
  
  def username
    attrs[:login]
  end
  
  def image_url
    attrs[:avatar_url]
  end
  
  def email
    attrs[:email]
  end
  
  def bio
    attrs[:bio]
  end
  
  def company
    attrs[:company]
  end
  
  def location
    attrs[:location]
  end
  
  def followers_count
    attrs[:followers]
  end
  
  def following_count
    attrs[:following]
  end
  
  def starred(token)
    GithubService.new(token).starred
  end
  
  def star_count(token)
    starred(token).count
  end

  def followers
    GithubService.new(token).followers.map do |user|
      GithubUser.new(user, token)
    end
  end
  
  # def following
  #   GithubService.new(@token).following.map do |user|
  #     GithubUser.new(user, @token)
  #   end
  # end
  # 
  # def repos
  #   Repo.repos(@token)
  # end
  # 
  # def organizations
  #   Organization.organizations(@token)
  # end
  # 
  # def events(nickname)
  #   Event.events(nickname, @token)
  # end
  # 
  # def recent_commits(nickname)
  #   Event.recent_commits(nickname, @token)
  # end
  
  private
  
  attr_reader :_attrs, :_token
  alias_method :attrs, :_attrs
  alias_method :token, :_token
  
end