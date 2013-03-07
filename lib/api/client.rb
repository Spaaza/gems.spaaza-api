module SpaazaApi
  class Client
    include SpaazaApi::Analytics
    include SpaazaApi::Categories
    include SpaazaApi::Chains
    include SpaazaApi::Claims
    include SpaazaApi::Facebook
    include SpaazaApi::Images
    include SpaazaApi::Inventory
    include SpaazaApi::Prices
    include SpaazaApi::Products
    include SpaazaApi::Reservations
    include SpaazaApi::Session
    include SpaazaApi::Shops
    include SpaazaApi::User

    attr_reader :username, :session_key, :http, :host

    def initialize(opts)
      @http = HTTPClient.new
      @host = opts[:host] || ENV['spaaza_api_url']
      @username = opts[:username]
      @session_key = opts[:session_key]
      @debug = opts[:debug] || false

      raise(ArgumentError, "host required") unless host
    end

    def authenticated?
      username && session_key ? true : false
    end

    def get(url, args={}) 
      request 'get', url, args
    end

    def post(url, args={}) 
      request 'post', url, args
    end   

    def put(url, args={}) 
      request 'put', url, args
    end    

    def delete(url, args={}) 
      request 'delete', url, args
    end        

    def request(method, url, args={})
      uri = host + url
      header = {'session_username' => username, 'session_key' => session_key, 'session_user_id' => username }
      
      query = api_params args, :query
      body = api_params args, :body

      if @debug && defined?(Rails)
        Rails.logger.debug "SPAAZA API Client : #{method} #{url} : headers=#{header.inspect} : query=#{query.inspect} : body=#{body.inspect}" 
      end

      res = http.request method, uri, query, body, header
      return SpaazaApi::Response.new res

    rescue Exception => ex
      p ex
      SpaazaApi::Response.new nil, ex
    end

    def api_params(hash, key)
      (hash[key] || {}).reject { |k, v| !v }
    end
  end
end