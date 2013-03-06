module SpaazaApi
  module Categories
    def category_get_shoporchaincategories_public (shop_id, chain_id)
      params = {}
      params[:business_id] = shop_id.blank? ? nil : shop_id
      params[:chain_id] = chain_id.blank? ? nil : chain_id

      get '/public/search-categories.json', :query => params
    end

    def category_get_categoriesfromparent_public(category_id)
      get '/public/category-tree.json', :query => {:category_id => category_id}
    end

    def category_get_orderedsubcategories_public(category_id)
      get '/public/category-tree.json', :query => {:category_id => category_id}
    end

    def category_get_orderedcategories_public
      get "/public/category-tree.json"
    end
  end    
end