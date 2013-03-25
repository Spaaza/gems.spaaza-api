module SpaazaApi
  module User
    def user_get_userbusinesses_auth
      if username_string?(username)
        query = {:user_username => username}
      else
        query = {:user_id => username}
      end
      get '/auth/get-user-permissions.json', :query => query
    end

    def user_get_chainbusinesses_public(chain_id, search_lat=nil, search_long=nil, search_radius_km=nil)
      get '/public/chain-businesses.json', :query=> {
        :chain_id => chain_id,
        :search_lat => search_lat,
        :search_long => search_long,
        :search_radius_km => search_radius_km
      }
    end

    def user_signup(first_name, email, password, verification_url, last_name=nil, gender=nil, birthday=nil)
      require_protected_path
      post "#{protected_path}/signup.json", :body => {
        :first_name => first_name,
        :username => email,
        :password => password,
        :verification_url_template => verification_url,
        :last_name => last_name,
        :gender => gender,
        :birthday => birthday
      }  
    end

    def user_verify(verification_key)
      require_protected_path
      post "#{protected_path}/user-verify.json", :body => { :verification_key => verification_key }
    end
  end
end
