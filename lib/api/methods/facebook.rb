module SpaazaApi
  module Facebook
    def fb_login(access_token, expires)
      require_protected_path
      post "#{protected_path}/login-fb.json", :body => {
        :fb_access_token => access_token,
        :fb_access_token_expires => expires
      }
    end

    def fb_deauthorise(signed_request)
      require_protected_path
      post "#{protected_path}/facebook-deauthorise.json", :body => {
        :signed_request => signed_request
      }
    end
end
