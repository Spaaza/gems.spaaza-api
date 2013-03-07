module SpaazaApi
  module Facebook
    def fb_login(access_token, expires)
      post '/internal/login-fb.json', :body => {
        :fb_access_token => access_token,
        :fb_access_token_expires => expires
      }
    end    

    def fb_login_status(user_id, session_key)
      get '/internal/get-login-status-fb.json', :query => {
        :user_id => user_id,
        :session_key => session_key,
        :session_auth_method => 'facebook'
      }
    end
  end
end