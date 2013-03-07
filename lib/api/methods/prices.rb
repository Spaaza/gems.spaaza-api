module SpaazaApi
  module Prices
    def get_all_prices(user_id, claim_status)
      get '/internal/get-var-price-claims-user.json', :query => {
        :user_id => user_id,
        :claim_status => claim_status,
        :entity_grouping => 1
      }
    end

    def get_price(product_id, claim_key=nil)
      get '/internal/get-var-price-user.json', :query => {
        :product_id => product_id,
        :claim_key => claim_key
      }
    end

    def get_prices_entity(business_id=nil, chain_id=nil) 
      get 'internal/get-var-prices-entity.json', :query => {
        :business_id => business_id, 
        :chain_id => chain_id 
      }
    end

    def variable_get_variableprice_auth(product_id)
      get '/internal/get-var-price.json', :query => {:product_id => product_id }
    end

    def variable_put_variableprice_auth (product_id, key, value)
      put '/internal/alter-var-price.json', :body => {
        :product_id => product_id, 
        key => value 
      }
    end

    def variable_delete_variableprice_auth(var_price_id)
      delete '/internal/delete-var-price.json', :body => {
        :var_price_id => var_price_id 
      }
    end

    def variable_post_variableprice_auth(product_id, base_price_threshold, gender, weighting_gender, age_range_low, age_range_high, weighting_age_range, weighting_fb_like_parent_entity, weighting_mailing_list_parent_entity, weighting_fb_share_link, published_status)
      post '/internal/add-var-price.json', :body => {
        :product_id => product_id,
        :base_price_threshold => base_price_threshold,
        :published_status => published_status,
        :gender => gender,
        :weighting_gender => weighting_gender,
        :age_range_low => age_range_low,
        :age_range_high => age_range_high,
        :weighting_age_range => weighting_age_range,
        :weighting_fb_like_parent_entity => weighting_fb_like_parent_entity,
        :weighting_mailing_list_parent_entity => weighting_mailing_list_parent_entity,
        :weighting_fb_share_link => weighting_fb_share_link
      }
    end

    def get_cards(user_id, include_expired=nil, voucher_status=nil, search_lat=nil, search_long=nil, search_radius_km=nil, results_offset=nil, number_results=nil, ssl_images=nil, chain_id=nil, business_id=nil)
      get '/internal/get-entity-cards-user.json', :query => {
        :user_id => user_id,
        :include_expired => include_expired,
        :voucher_status => voucher_status,
        :search_lat => search_lat,
        :search_long => search_long,
        :search_radius_km => search_radius_km,
        :results_offset => results_offset,
        :ssl_images => ssl_images,
        :chain_id => chain_id,
        :business_id => business_id
      }
    end

    def add_card(user_id, business_id=nil, chain_id=nil)
      post '/internal/add-entity-card-user.json', :body => {
        :business_id => business_id,
        :chain_id => chain_id,
        :user_id => user_id
      }
    end

    def delete_card(business_id = nil, chain_id = nil)
      delete '/internal/delete-entity-card-user.json', :body => {
        :business_id => business_id,
        :chain_id => chain_id
      }
    end    

    def make_claim(claim_id, claim_key)
      post '/internal/add-var-price-claim.json', :body => {
        :claim_id => claim_id,
        :claim_key => claim_key
      }
    end

    def add_scan(product_id)
      post '/internal/add-var-price-scan.json', :body => {
        :product_id => product_id
      }
    end

    def get_claim(claim_code, claim_view_type)
      get '/internal/get-var-price-claim.json', :query => {
        :claim_code => claim_code,
        :claim_view_type => claim_view_type
      }
    end

    def delete_claim(claim_id)
      delete '/internal/delete-var-price-claim.json', :body => {
        :claim_id => claim_id
      }
    end
  end
end