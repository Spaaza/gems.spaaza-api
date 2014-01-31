module SpaazaApi
  module Images
    def get_image_thumbnail(image)
      post "/public/image-to-thumbnail.json", :body => {
        :imagefile => File.new(image, 'rb')
      }
    end

    def mark_image_primary(image_seq_num, product_id)
      put '/auth/alter-product-image-primary.json', :body => {
        :product_id => product_id, 
        :image_seq_num => image_seq_num
      }
    end

    def delete_product_image(image_id, product_id)
      delete '/auth/delete-product-image.json', :body => {
        :product_id => product_id, 
        :image_seq_num => image_id
      }
    end

    def add_product_image(product_id, image, image_seq_num, colour_tags)
      post '/auth/add-product-image.json', :body => {
        :product_id => product_id, 
        :imagefile => File.new(image, 'rb'),
        :image_seq_num => image_seq_num,
        :colour_tags => colour_tags
      }
    end

    def delete_shop_image(business_id, image)
      delete '/auth/delete-business-image.json', :body => {
        :business_id => business_id,
        :imagefile => File.new(image, 'rb'),
        :image_seq_num => 0
      }
    end

    def add_shop_image(business_id, image)
      post '/auth/add-business-image.json', :body => {
        :business_id => business_id,
        :imagefile => File.new(image, 'rb'),
        :image_seq_num => 0
      }
    end
  end
end
