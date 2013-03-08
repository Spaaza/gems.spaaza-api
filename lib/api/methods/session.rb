module SpaazaApi
  module Session
    def login(username, password)
      post "/auth/login.json", :body => {
        :username => username, 
        :password => password
      }
    end

    def logout
      delete "/logout.json"
    end    

    def get_login_status(user_id=nil, name=nil, key=nil)
      get "/auth/get-login-status.json", :query => {
        :user_id => user_id,
        :username => name || username, 
        :session_key => key || session_key
      }
    end
  end
end