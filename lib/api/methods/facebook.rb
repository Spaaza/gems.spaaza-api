module SpaazaApi
  module Facebook
    def fb_login(access_token, expires)
      post '/internal/login-fb.json', :body => {
        :fb_access_token => access_token,
        :fb_access_token_expires => expires
      }
    end 
  end
end