class GithubService
  
  def initialize(token)
    @_token = token
    @_conn = Faraday.new("https://api.github.com/")
  end
  
  def find_user
    parser(conn.get "/user?access_token=#{token}")
  end
  
  private
  
  def token
    @_token
  end
  
  def conn
    @_conn
  end
  
  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
end