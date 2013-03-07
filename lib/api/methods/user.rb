module SpaazaApi
  module User
    def user_get_userbusinesses_auth
      get '/auth/get-user-permissions.json', :query => {:user_username => username}
    end

    def user_get_chainbusinesses_public(chain_id)
      get '/public/chain-businesses.json', :query=> {:chain_id => chain_id}
    end

    def user_signup(first_name, email, password, last_name=nil, gender=nil, birthday=nil)
      post '/internal/signup.json', :body => {
        :first_name => first_name,
        :email => email,
        :password => password,
        :last_name => last_name,
        :gender => gender,
        :birthday => birthday
      }  
    end
  end
end