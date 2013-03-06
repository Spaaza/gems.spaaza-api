module SpaazaApi
  module Products
    def get_product_by_owner_code(owner_code)
      get '/public/search-products.json', :query => {:product_owner_code => owner_code}
    end

    def get_product_by_url(url)
      get '/public/search-products.json', :query => {:search_web_url => url}
    end
  
    def reserve_product(inventory_id, customer_firstname, customer_lastname, customer_email_address, customer_phone_number)
      post '/auth/add-inventory-reservation.json', :body => {
        :inventory_id => inventory_id,
        :customer_firstname => customer_firstname,
        :customer_lastname => customer_lastname,
        :customer_email_address => customer_email_address,
        :customer_phone_number => customer_phone_number
      }
    end

    def product_get_allproducts_public(category_id, search_string, search_colour, search_brand, search_gender, search_adult_child, search_lat, search_long, search_radius_km, order_by)
      get 'public/search-products.json', :query => {
        :category_id => category_id,
        :search_string => search_string,
        :search_colour => search_colour,
        :search_brand => search_brand,
        :search_gender => search_gender,
        :search_adult_child => search_adult_child,
        :search_lat => search_lat,
        :search_long => search_long,
        :search_radius_km => search_radius_km,
        :order_by => order_by
      }
    end

    def product_put_editproductsingleattrib_auth(product_id, key, value)
      put '/auth/alter-product.json', :body => {
        :product_id => product_id,
        key => value
      }
    end

    def product_get_productinfo_public(product_id)
      get '/public/product-info.json', :query => {:product_id => product_id}
    end

    def product_get_productinfo_auth(product_id)
      get '/auth/get-product-info.json', :query => {:product_id => product_id}
    end

    def product_get_productinventory_public(entity_type, entity_id, product_id, category_id, search_string, search_colour, search_size, search_lat, search_long, search_radius_km, order_by, results_offset, number_results)
      get 'public/search-inventory.json', :query => {
        :product_id => product_id,
        :business_id => entity_type == "business" ? entity_id : nil,
        :chain_id => entity_type != "business" ? entity_id : nil,
        :category_id => category_id,
        :search_string => search_string,
        :search_colour => search_colour,
        :search_size => search_size,
        :search_lat => search_lat,
        :search_long => search_long,
        :search_radius_km => search_radius_km,
        :order_by => order_by,
        :results_offset => results_offset,
        :number_results => number_results
      }      
    end

    def get_productinventorychain_auth(product_id, business, order_by=name, results_offset=0, total_prods=$max_per_page)
      get '/auth/get-inventory.json', :query => { 
        :chain_id => business['chain_id'],
        :product_id => product_id,
        :order_by => order_by,
        :number_results => total_prods,
        :results_offset => results_offset
      }
    end

    def product_get_productinventorybusiness_auth(product_id, business_id)
      get '/auth/get-inventory.json', :query => {
        :business_id => business_id,
        :product_id => product_id
      }
    end

    def product_delete_deleteproduct_auth(product_id, nuclear_option=nil)
      delete '/auth/delete-product.json', :body => {
        :product_id => product_id,
        :nuclear_option => nuclear_option
      }
    end

    def product_get_productdetails_public(product_id)
      get '/public/product-info.json', :query => { :product_id=> product_id }
    end

    def product_put_editproductmanyattribs_auth(params)
      put '/auth/alter-product.json', :body => params
    end

    def product_post_newproduct_auth(entity_type, entity_id, params)
      params[entity_type == "chain" ? :chain_id : :business_id] = entity_id
      post '/auth/add-product.json', :body => params
    end
  end
end