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

    def get_price(product_id, voucher_key=nil, inventory_barcode=nil, entity=nil)
      require_protected_path
      if inventory_barcode.blank?
        query = {:product_id => product_id, :voucher_key => voucher_key}
      else
        query = {:inventory_barcode => inventory_barcode, :voucher_key => voucher_key}
        query[(entity[:type]+"_id").to_sym] = entity[:id]
      end
      get "#{protected_path}/get-var-price-user.json", :query => query
    end

    def get_var_price_product_info(product_id, inventory_barcode=nil, entity=nil)
      require_protected_path
      if inventory_barcode.blank?
        query = {:product_id => product_id}
      else
        query = {:inventory_barcode => inventory_barcode}
        query[(entity[:type]+"_id").to_sym] = entity[:id]
      end
      get "#{protected_path}/get-var-price-product-info.json", :query => query
    end

    def get_prices_entity(business_id=nil, chain_id=nil) 
      require_protected_path
      get "#{protected_path}/get-var-prices-entity.json", :query => {
        :business_id => business_id, 
        :chain_id => chain_id 
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

    def get_card(ssl_images=nil)
      require_protected_path
      get "#{protected_path}/get-user-entity-card.json", :query => {
        :ssl_images => ssl_images
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

    def add_scan(product_id, inventory_barcode=nil, entity=nil)
      require_protected_path
      if inventory_barcode.blank?
        body = {:product_id => product_id}
      else
        body = {:inventory_barcode => inventory_barcode}
        body[(entity[:type]+"_id").to_sym] = entity[:id]
      end
      post "#{protected_path}/add-var-price-scan.json", :body => body
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

    def get_user_vouchers()
      require_protected_path
      get "#{protected_path}/get-user-vouchers.json"
    end

    def claim_voucher(voucher_key)
      require_protected_path
      post "#{protected_path}/claim-voucher.json", :body => {
        :voucher_key => voucher_key
      }
    end

    def delete_voucher(voucher_key)
      require_protected_path
      delete "#{protected_path}/delete-voucher.json", :body => {
        :voucher_key => voucher_key
      }
    end

    def get_var_price_claim(claim_code)
      require_protected_path
      get "#{protected_path}/get-var-price-claim.json", :query => {
        :claim_code => claim_code,
        :claim_view_type => 'retailer'
      }
    end

    # 20140303 FIXME To be deprecated
    def get_var_price_vouchers_user()
      require_protected_path
      get "#{protected_path}/get-user-vouchers.json"
    end

  end
end
