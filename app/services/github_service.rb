class GithubService
  
  def initialize(token)
    @_token = token
    @_conn = Faraday.new("https://api.github.com/")
  end
  
  def find_user
    parser(conn.get "/user?access_token=#{token}")
  end
  
  private
  
  attr_reader :_token, :_conn
  alias_method :token, :_token
  alias_method :conn, :_conn
  
  def parser(response)
    JSON.parse(response.body, symbolize_names: true)
  end
  
end