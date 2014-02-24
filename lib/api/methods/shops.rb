module SpaazaApi
  module Shops
    def shop_get_shopinfo_public(business_id)
      get '/public/business-info.json', :query => {:business_id => business_id}
    end

    def shop_get_chainshops_public(chain_id)
      get '/auth/get-chain-businesses.json', :query => {:chain_id => chain_id}
    end

    def shop_get_searchproductsautocomplete_public(search_str, type, business_id)
      get '/public/search-products.json', :query => {
        "{type}_id" => business_id, 
        :search_string => search_str, 
        :order_by => name 
      }
    end

    def shop_get_businessproductslist_auth(shop_id, order_by, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
      get '/auth/get-products.json', :query => {
        :business_id => shop_id,
        :number_results => 50,
        :results_offset => results_offset,
        :order_by => order_by,
        :product_published_status => published_status,
        :search_string => search_string,
        :category_id => category_id,
        :search_gender => search_gender,
        :search_colour => search_colour
      }
    end

    def shop_get_businessproductslist_public(shop_id, order_by, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
      get '/public/search-products.json', :query => {
        :business_id => shop_id,
        :category_id => category_id,
        :search_string => search_string,
        :search_colour => search_colour,
        :search_gender => search_gender
      }
    end

    def shop_get_businessproducts_auth(business, order_by='name', total_products=20, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
      get '/auth/get-products.json', :query => {
        :business_id => business['business_id'].blank? ? nil : business['business_id'],
        :chain_id => business['chain_id'].blank? ? nil : business['chain_id'],
        :number_results => total_products,
        :results_offset => results_offset,
        :product_published_status => published_status,
        :order_by => order_by,
        :category_id => category_id,
        :search_string => search_string,
        :search_colour => search_colour,
        :search_gender => search_gender
      }      
    end

    def shop_get_productsforbusiness_auth(business, order_by, total_products=20, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
      get '/auth/get-products.json', :query => {
        :business_id => business['business_id'].blank? ? nil : business['business_id'],
        :chain_id => business['chain_id'].blank? ? nil : business['chain_id'],
        :number_results => total_products,
        :results_offset => results_offset,
        :product_published_status => published_status,
        :order_by => order_by,
        :category_id => category_id,
        :search_string => search_string,
        :search_colour => search_colour,
        :search_gender => search_gender
      }
    end

  end
end
