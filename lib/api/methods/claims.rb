module SpaazaApi
  module Claims
    def make_claim(claim_code)
      put "/internal/alter-var-price-claim-verify.json", :body => {
        :claim_code => claim_code
      }
    end

    def get_var_price_claim(claim_code)
      get "/internal/get-var-price-claim.json", :query => {
        :claim_code => claim_code,
        :claim_view_type => 'retailer'
      }
    end
  end
end