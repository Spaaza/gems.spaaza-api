module SpaazaApi
  class Response
    attr_accessor :error
    attr_reader :data, :results, :status

    def initialize(res, err=nil)
      @status = res.status if res
      @data = JSON.parse(res.content) if res
      @error = err || data_error_message
    end

    def results
      @data ||= {}
      @data['results']
    end

    def results!
      raise error if error? 
      @data['results']
    end    

    def empty?; data ? false : true; end
    def error?; error || status_error? ? true : false; end

    def status_ok? 
      data && data["result"] && (data["result"]["status"] == "ok" || data["result"]["code"] == 1)
    end

    def status_error? 
      data && data["result"] && (data["result"]["status"] == "error" || data["result"]["code"] == 0)
    end

    private

      def data_error_message
        if data && data['result'] && data['result']['status'] == 'error' 
           data['errors'].map { |k,v| "#{v['name']} - #{v['description']}" }.join(" \n")
        end
      end
  end
end