module SpaazaApi
  module Prices
    def get_all_prices(user_id, claim_status)
      require_protected_path
      get "#{protected_path}/get-var-price-claims-user.json", :query => {
        :user_id => user_id,
        :claim_status => claim_status,
        :entity_grouping => 1
      }
    end

    def get_price(product_id, claim_key=nil)
      require_protected_path
      get "#{protected_path}/get-var-price-user.json", :query => {
        :product_id => product_id,
        :claim_key => claim_key
      }
    end

    def get_var_price_product_info(product_id)
      require_protected_path
      get "#{protected_path}/get-var-price-product-info.json", :query => {:product_id => product_id }
    end

    def get_prices_entity(business_id=nil, chain_id=nil) 
      require_protected_path
      get "#{protected_path}/get-var-prices-entity.json", :query => {
        :business_id => business_id, 
        :chain_id => chain_id 
      }
    end

    def variable_get_variableprice_auth(product_id)
      require_protected_path
      get "#{protected_path}/get-var-price.json", :query => {:product_id => product_id }
    end

    def variable_put_variableprice_auth (product_id, key, value)
      require_protected_path
      put "#{protected_path}/alter-var-price.json", :body => {
        :product_id => product_id, 
        key => value 
      }
    end

    def variable_delete_variableprice_auth(var_price_id)
      require_protected_path
      delete "#{protected_path}/delete-var-price.json", :body => {
        :var_price_id => var_price_id 
      }
    end

    def variable_post_variableprice_auth(product_id, base_price_threshold, gender, weighting_gender, age_range_low, age_range_high, weighting_age_range, weighting_fb_like_parent_entity, weighting_mailing_list_parent_entity, weighting_fb_share_link, published_status)
      require_protected_path
      post "#{protected_path}/add-var-price.json", :body => {
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
      require_protected_path
      get "#{protected_path}/get-entity-cards-user.json", :query => {
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
      require_protected_path
      post "#{protected_path}/add-entity-card-user.json", :body => {
        :business_id => business_id,
        :chain_id => chain_id,
        :user_id => user_id
      }
    end

    def delete_card(business_id = nil, chain_id = nil)
      require_protected_path
      delete "#{protected_path}/delete-entity-card-user.json", :body => {
        :business_id => business_id,
        :chain_id => chain_id
      }
    end    

    def make_claim(claim_id, claim_key)
      require_protected_path
      post "#{protected_path}/add-var-price-claim.json", :body => {
        :claim_id => claim_id,
        :claim_key => claim_key
      }
    end

    def add_scan(product_id)
      require_protected_path
      post "#{protected_path}/add-var-price-scan.json", :body => {
        :product_id => product_id
      }
    end

    def get_claim(claim_code, claim_view_type)
      require_protected_path
      get "#{protected_path}/get-var-price-claim.json", :query => {
        :claim_code => claim_code,
        :claim_view_type => claim_view_type
      }
    end

    def delete_claim(claim_id)
      require_protected_path
      delete "#{protected_path}/delete-var-price-claim.json", :body => {
        :claim_id => claim_id
      }
    end
  end
end
