module SpaazaApi
  module Inventory
    def create_new_inventory (business_id, product_id, inventory_condition, inventory_published_status, inventory_stock_status, inventory_size, inventory_colour, inventory_price)
      post '/auth/add-inventory.json', :body => {
        :product_id => product_id,
        :business_id => business_id,      
        :inventory_condition => inventory_condition,
        :inventory_published_status => inventory_published_status,
        :inventory_stock_status => inventory_stock_status,
        :inventory_price => inventory_price,
        :inventory_colour => inventory_colour,
        :inventory_size => inventory_size
      }        
    end

    def update_inventory_published_bulk (product_id, entity_type, entity_id, inventory_published_status )
      put '/auth/alter-inventory-published-status-bulk.json', :body => {
        :product_id => product_id,
        :inventory_published_status => inventory_published_status,
        :chain_id => entity_type == "chain" ? entity_id : nil,
        :business_id => entity_type != "chain" ? entity_id : nil,
      }
    end

    def update_inventory (business_id, product_id, inventory_id, key, value)
      put '/auth/alter-inventory-published-status-bulk.json', :body => {
        key => value,
        :inventory_id => inventory_id,
        :business_id => business_id
      }        
    end

    def delete_inventory (business_id, inventory_id)
      delete '/auth/delete-inventory.json', :body => {
        :inventory_id => inventory_id,
        :business_id => business_id
      }
    end
  end
end