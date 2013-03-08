SPAAZA API
==========
Ruby gem client for the SPAAZA API. 

Usage:
==========

Initialize the client with API connection and user authorization info:

    es = SpaazaApi::Client.new :username => 'myname', 
                               :session_key => 'mycookie',
                               :debug => true,
                               :host => 'https://apidev0.spaaza.com/t_002'

The client provides a restful interface for making http requests to the spaaza API by way of the `httpclient` Ruby gem. 

    es.get '/some/api/url/get-method.json', :query => {:buiness_id => 1234}
    es.put '/some/api/url/update-method.json', :body => {:buiness_id => 1234, :name => 'example'}
    es.post '/some/api/url/add-method.json', :body => {:buiness_id => 1234, :name => 'example'}
    es.delete '/some/api/url/destroy-method.json', :body => {:buiness_id => 1234}

Note that empty-valued params are rejected from the API request, e.g. `:query => {:gender => nil}`.

Authorization:
=========

The client is authorized through the given `username` and `session_key`, although not all spaaza API endpoints require authorization and can be called without a user, e.g.

    SpaazaApi::Client.new(:host => some_host).chain_get_productbusinesses_public some_product_id

Setting the `username` authorizes the API call both with username- and user_id-based API session headers.

Response:
=========

The `SpaazaApi::Response` class is always returned by client requests. This response wraps spaaza api logic and provides control over error handling.

    res = es.get '/some/api/url/'

The response data can be accessed through the `data` helper, which contains the parsed json data returned by the spaaza api request.

    res.data => {...}

Because the spaaza api returns a results object for successful requests, the client provides a `results` helper.

    res.results == res.data['results'] => true

The destructive version of the results helper throws an exception if the results are empty. This can be used as a sort of assertion for results that are always expected by the client consumer.

    res.results!

The spaaza API response status/code can be inspected with helpers.

    res.status_ok?
    res.status_error?

An explicit error in the request, for any reason from http exceptions to spaaza API error results, can always be inspected. In general, the response should be inspected for errors by the client consumer, because they are otherwise suppressed in favor of silent failure.

    puts res.error if res.error? => 'some error message'

Spaaza API Methods:
==================

The spaaza client provides convenience wrappers for the spaaza API method endpoints and parameters. 

+ user_get_userbusinesses_auth 
+ user_get_chainbusinesses_public(chain_id, search_lat=nil, search_long=nil, search_radius_km=nil)
+ shop_get_shopinfo_public(business_id)
+ shop_get_chainshops_public(chain_id)
+ shop_get_searchproductsautocomplete_public(search_str, type, business_id)
+ shop_get_businessproductslist_auth(shop_id, order_by, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
+ shop_get_businessproductslist_public(shop_id, order_by, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
+ shop_get_businessproducts_auth(business, order_by='name', total_products=20, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
+ shop_get_productsforbusiness_auth(business, order_by, total_products=20, results_offset=0, published_status=nil, search_string=nil, category_id=nil, search_gender=nil, search_colour=nil)
+ get_short_code_info(entity_short_code)
+ login(username, password)
+ logout
+ get_login_status(user_id=nil, key=nil)
+ get_reservation(reservation_id)
+ update_reservation(reservation_id, status)
+ get_product_by_owner_code(owner_code)
+ get_product_by_url(url)
    reserve_product(inventory_id, customer_firstname, customer_lastname, customer_email_address, customer_phone_number)
+ product_get_allproducts_public(category_id, search_string, search_colour, search_brand, search_gender, search_adult_child, search_lat, search_long, search_radius_km, order_by)
+ product_put_editproductsingleattrib_auth(product_id, key, value)
+ product_get_productinfo_public(product_id)
+ product_get_productinfo_auth(product_id)
+ product_get_productinventory_public(entity_type, entity_id, product_id, category_id, search_string, search_colour, search_size, search_lat, search_long, search_radius_km, order_by, results_offset, number_results)
+ get_productinventorychain_auth(product_id, business, order_by=name, results_offset=0, total_prods=$max_per_page)
+ product_get_productinventorybusiness_auth(product_id, business_id)
+ (product_id, nuclear_option=nil)
+ product_get_productdetails_public(product_id)
+ product_put_editproductmanyattribs_auth(params)
+ product_post_newproduct_auth(entity_type, entity_id, params)
+ get_all_prices(user_id, claim_status)
+ get_prices_entity(business_id=nil, chain_id=nil) 
+ get_price(product_id, claim_key=nil)
+ variable_get_variableprice_auth(product_id)
+ variable_put_variableprice_auth (product_id, key, value)
+ variable_delete_variableprice_auth (var_price_id)
+ variable_post_variableprice_auth (product_id, base_price_threshold, gender, weighting_gender, age_range_low, age_range_high, weighting_age_range, weighting_fb_like_parent_entity, weighting_mailing_list_parent_entity, weighting_fb_share_link, published_status)
+ create_new_inventory (business_id, product_id, inventory_condition, inventory_published_status, inventory_stock_status, inventory_size, inventory_colour, inventory_price)
+ update_inventory_published_bulk (product_id, entity_type, entity_id, inventory_published_status )
+ update_inventory (business_id, product_id, inventory_id, key, value)
+ delete_inventory (business_id, inventory_id)
+ get_product_inventory(product_id)
+ get_image_thumbnail(image)
+ mark_image_primary(image_seq_num, product_id)
+ delete_product_image(image_id, product_id)
+ add_product_image(product_id, image, image_seq_num)
+ delete_shop_image(business_id, image)
+ add_shop_image(business_id, image)
+ get_chain(chain_id)
+ chain_get_productbusinesses_public(product_id, search_lat='', search_long='', search_radius_km='', results_offset='', number_results='')
+ chain_get_chainproductslist_auth(chain_id, order_by, results_offset=0, published_status='', search_string='', category_id='', search_gender='', search_colour='')
+ chain_get_chainproductslist_public(chain_id, order_by, results_offset=0, published_status='', search_string='', category_id='', search_gender='', search_colour='')
+ search_productslist_public(business_id='', chain_id='', category_id='', search_string='', search_colour='', search_brand='', search_gender='', search_adult_child='', search_lat='', search_long='', search_radius_km='', order_by='', results_offset='', number_results=nil, ssl_images='')
+ category_get_shoporchaincategories_public (shop_id, chain_id)
+ category_get_categoriesfromparent_public(category_id)
+ category_get_orderedsubcategories_public(category_id)
+ category_get_orderedcategories_public
+ analytics_get_basket_sales(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_event_analytics(business_id, chain_id, index, type, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_top_products_scanned(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_top_products_sold(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_user_demographics(business_id, chain_id, from_date=nil, to_date=nil)
+ analytics_get_user_interests(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_user_registrations(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_member_conversions(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_purchase_conversions(business_id, chain_id, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ analytics_get_unique_shoppers(business_id, chain_id, type, gender=nil, from_date=nil, to_date=nil, from_age=nil, to_age=nil)
+ fb_login(access_token, expires)
+ make_claim(claim_code)
+ get_var_price_claim(claim_code)
+ user_signup(first_name, email, password, verification_url, last_name=nil, gender=nil, birthday=nil)
+ get_cards(user_id, include_expired=nil, voucher_status=nil, search_lat=nil, search_long=nil, search_radius_km=nil, results_offset=nil, number_results=nil, ssl_images=nil, chain_id=nil, business_id=nil)
+ add_card(user_id, business_id=nil, chain_id=nil)
+ delete_card(business_id = nil, chain_id = nil)
+ make_claim(claim_id, claim_key)
+ add_scan(product_id)
+ get_claim(claim_code, claim_view_type)
+ delete_claim(claim_id)