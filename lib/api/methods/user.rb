module SpaazaApi
  module User
    def user_get_userbusinesses_auth
      get '/auth/get-user-permissions.json', :query => {:user_username => username}
    end

    def user_get_chainbusinesses_public(chain_id)
      get '/public/chain-businesses.json', :query=> {:chain_id => chain_id}
    end
  end
end