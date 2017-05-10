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
  
  def login
    attrs[:login]
  end
  
  def avatar_url
    attrs[:avatar_url]
  end
  
  def email
    attrs[:email]
  end
  
  def id
    attrs[:id]
  end
  
  def followers
    attrs[:followers]
  end
  
  def following
    attrs[:following]
  end
  
  private
  
  attr_reader :_attrs
  alias_method :attrs, :_attrs
  
end