module SpaazaApi
  module Prices
    def variable_get_variableprice_auth(product_id)
      get '/internal/get-var-price.json', :query => {:product_id => product_id }
    end

    def variable_put_variableprice_auth (product_id, key, value)
      put '/internal/alter-var-price.json', :body => {
        :product_id => product_id, 
        key => value 
      }
    end

    def variable_delete_variableprice_auth (var_price_id)
      delete '/internal/delete-var-price.json', :body => {
        :var_price_id => var_price_id 
      }
    end

    def variable_post_variableprice_auth (product_id, base_price_threshold, gender, weighting_gender, age_range_low, age_range_high, weighting_age_range, weighting_fb_like_parent_entity, weighting_mailing_list_parent_entity, weighting_fb_share_link, published_status)
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
  end
end