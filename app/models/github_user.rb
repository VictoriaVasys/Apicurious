class GithubUser
  
  def initialize(attrs={})
    @_attrs = attrs
  end
  
  def self.find_by(token)
    user = GithubService.new(token).find_user
    new(user)
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

  # def followers(token)
  #   GithubService.new(token).followers.map do |user|
  #     user[:login]
  #   end
  # end
  
  private
  
  attr_reader :_attrs
  alias_method :attrs, :_attrs
  
end