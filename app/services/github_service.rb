class GithubService
  
  def initialize(token)
    @_token_param = {access_token: token}
    @_conn = Faraday.new("https://api.github.com/")
  end
  
  def find_user
    parser(conn.get("/user", token_param))
  end
  
  def starred
    parser(conn.get("/user/starred", token_param))
  end

  def followers
    parser(conn.get("/user/followers", token_param))
  end
  
  def following
    parser(conn.get("/user/following", token_param))
  end

  def repos
    parser(conn.get do |req|  
      req.url '/user/repos', token_param
      req.params['per_page'] = 100
    end)
  end
  
  private
  
  attr_reader :_token_param, :_conn
  alias_method :token_param, :_token_param
  alias_method :conn, :_conn
  
  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
end