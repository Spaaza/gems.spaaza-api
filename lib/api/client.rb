require 'logger'


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

    attr_reader :username, :session_key, :http, :host, :protected_path, :myprice_app_hostname, :usercookie

    def initialize(opts)
      @http = HTTPClient.new
      @host = opts[:host] || ENV['spaaza_api_url']
      @username = opts[:username]
      @session_key = opts[:session_key]
      @debug = opts[:debug] || false
      @protected_path = opts[:protected_path]
      @usercookie = opts[:usercookie]
      @client_request = opts[:request]
      @logger = Logger.new(STDOUT)
      raise(ArgumentError, "host required") unless host
    end

    def set_myprice_app_hostname(hostname)
      @myprice_app_hostname = hostname
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

    def request_headers
      headers = {'Session-key' => session_key}

      if username_string?(username)
        headers['Session-Username'] = username
      else
        headers['Session-User-Id'] = username
      end

      if @myprice_app_hostname.present?
        headers['X-MyPrice-App-Hostname'] = @myprice_app_hostname
      end

      unless @client_request.nil?
        rq = {'language' => best_language}
        unless @client_request.env['HTTP_USER_AGENT'].nil?
          rq['user_agent'] = @client_request.env['HTTP_USER_AGENT']
        end

        rq['ip'] = @client_request.remote_ip

        headers['X-Spaaza-Request'] = rq.to_json

        unless @usercookie.blank?
          Rails.logger.debug "SPAAZA API Client usercookie: #{usercookie}"
          headers['X-Spaaza-UserCookie'] = @usercookie
        end
      end

      headers
    end

    def request(method, url, args={})
      uri = host + url
      header = request_headers
      
      query = api_params args, :query
      body = api_params args, :body

      if @debug && defined?(Rails)
        Rails.logger.debug "SPAAZA API Client : #{method} #{uri} : headers=#{header.inspect} : query=#{query.inspect} : body=#{body.inspect}" 
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

    def username_string?(string)
      string && string.is_a?(String) && string.include?('@') ? true : false
    end

    private

      def require_protected_path
        raise "Protected path is required for the client to query that endpoint" if protected_path.blank?
      end

      # Returns the languages accepted by the visitors, sorted by quality
      # (order of preference).
      # http://mashing-it-up.blogspot.nl/2008/10/parsing-accept-language-in-rails.html
      def best_language()
        # no language accepted
        return nil if @client_request.env["HTTP_ACCEPT_LANGUAGE"].nil?
        # parse Accept-Language
        accepted = @client_request.env["HTTP_ACCEPT_LANGUAGE"].split(",")
        accepted = accepted.map { |l| l.strip.split(";") }
        accepted = accepted.map { |l|
          if (l.size == 2)
            # quality present
            [ l[0].split("-")[0].downcase, l[1].sub(/^q=/, "").to_f ]
          else
            # no quality specified =&gt; quality == 1
            [ l[0].split("-")[0].downcase, 1.0 ]
          end
        }
        
        # sort by quality
        accepted.sort { |l1, l2| l1[1] <=> l2[1] }
        accepted[0][0]
      end
      
  end
end
