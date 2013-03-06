module SpaazaApi
  module Chains
    def chain_get_productbusinesses_public(product_id, search_lat='', search_long='', search_radius_km='', results_offset='', number_results='')
        get '/public/search-businesses.json', :query => {
          :product_id => product_id,
          :search_lat => search_lat,
          :search_long => search_long,
          :search_radius_km => search_radius_km,
          :results_offset => results_offset,
          :number_results => number_results
        }
    end

    def chain_get_chainproductslist_auth(chain_id, order_by, results_offset=0, published_status='', search_string='', category_id='', search_gender='', search_colour='')
        get '/auth/get-products.json', :query => { 
          :chain_id => chain_id,
          :product_published_status => published_status,
          :number_results => 50,
          :results_offset => results_offset,
          :order_by => order_by,
          :search_string => search_string,
          :category_id => category_id,
          :search_gender => search_gender,
          :search_colour => search_colour
        }
    end

    def chain_get_chainproductslist_public(chain_id, order_by, results_offset=0, published_status='', search_string='', category_id='', search_gender='', search_colour='')
        get '/public/search-products.json', :query => {
          :chain_id => chain_id,
          :category_id => category_id,
          :search_string => search_string,
          :search_colour => search_colour,
          :search_gender => search_gender
        }
    end

    def search_productslist_public(business_id='', chain_id='', category_id='', search_string='', search_colour='', search_brand='', search_gender='', search_adult_child='', search_lat='', search_long='', search_radius_km='', order_by='', results_offset='', number_results=nil, ssl_images='')
        get '/public/search-products.json', :query => {
          :business_id => business_id,
          :chain_id => chain_id,
          :category_id => category_id,
          :search_string => search_string,
          :search_colour => search_colour,
          :search_gender => search_gender,
          :search_brand => search_brand,
          :search_adult_child => search_adult_child,
          :search_lat => search_lat,
          :search_long => search_long,
          :search_radius_km => search_radius_km,
          :order_by => order_by,
          :number_results => results_offset,
          :ssl_images => ssl_images
        }
    end    
  end
end