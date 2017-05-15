class Repo

  def initialize(attrs={})
    @_attrs = attrs
  end

  def full_name
    attrs[:full_name]
  end
  
  def owner
    attrs[:owner][:login]
  end
  
  def name
    attrs[:name]
  end

  def description
    attrs[:description]
  end

  def language
    attrs[:language]
  end
  
  def updated_at
    attrs[:updated_at]
  end

  def self.starred(token)
    GithubService.new(token).starred.map do |repo|
      new(repo)
    end
  end

  def self.repos(token)
    sorted_repos_date(token).map do |repo|
      new(repo)
    end
  end
  
  def self.sorted_repos_date(token)
    user_repos(token).sort_by {|repo| repo[:updated_at]}.reverse
  end
  
  def self.user_repos(token)
    GithubService.new(token).repos.select do |repo|
      repo[:owner][:html_url].split(/\W+/).last == "VictoriaVasys" # dynamic GithubUser.find_by(token) is slow! any other way?
    end
  end
  
  private
  
  attr_reader :_attrs
  alias_method :attrs, :_attrs
  
end