module SpaazaApi
  module Reservations
    def get_reservation(reservation_id)
      #res = get '/auth/get-inventory-reservation-info.json', :query => {
      get '/auth/get-inventory-reservation-info.json', :query => {
        :inventory_reservation_id => reservation_id, 
        :ssl_images => true
      }
      #res.data && res.data['inventory_reservation']
    end
  
    def update_reservation(reservation_id, status)
      put '/auth/alter-inventory-reservation.json', :body => {
        :inventory_reservation_id => reservation_id,
        :inventory_reservation_status => status
      }
    end
  end
end
