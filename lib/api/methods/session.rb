module SpaazaApi
  module Session
    def login(name, password)
      post "/auth/login.json", :body => {
        :username => name, 
        :password => password
      }
    end

    def logout
      delete "/logout.json"
    end    

    def get_login_status(user_id=nil, key=nil)
      params = { :session_key => key || session_key }
      uid = user_id.blank? ? username : user_id

      if uid.include?('@')
        params[:username] = uid
      else
        params[:user_id] = uid
      end

      get "/auth/get-login-status.json", :query => params
    end
  end
end