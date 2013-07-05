module SpaazaApi
  module Analytics
    def analytics_get_basket_sales(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-basket-sales.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end

    def analytics_get_basket_stats(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-basket-stats.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end

    def analytics_get_event_analytics(business_id, chain_id, index, type, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-event-analytics.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :index => index, 
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age,
        :type => type
      }
    end   

    def analytics_get_top_products_scanned(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-top-products-scanned.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end   

    def analytics_get_top_products_sold(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-top-products-sold.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end   

    def analytics_get_user_demographics(business_id, chain_id, from_date=nil, to_date=nil)
      get '/auth/analytics/get-user-demographics.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :from_date => from_date,
        :to_date => to_date
      }
    end       

    def analytics_get_user_interests(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-user-interests.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end     

    def analytics_get_user_registrations(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-user-registrations.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end

    def analytics_get_member_conversions(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-member-conversions.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end    

    def analytics_get_purchase_conversions(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-purchase-conversions.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age
      }
    end

    def analytics_get_unique_shoppers(business_id, chain_id, type, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
      get '/auth/analytics/get-unique-shoppers.json', :query => {
        :business_id => business_id,
        :chain_id => chain_id,
        :gender => gender,
        :from_date => from_date,
        :to_date => to_date,
        :from_age => from_age,
        :to_age => to_age,
        :type => type
      }
    end    
  end
end