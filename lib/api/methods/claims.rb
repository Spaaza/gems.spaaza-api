module SpaazaApi
  module Claims
    def make_claim(claim_code)
      require_protected_path
      put "#{protected_path}/alter-var-price-claim-verify.json", :body => {
        :claim_code => claim_code
      }
    end

    def get_var_price_claim(claim_code)
      require_protected_path
      get "#{protected_path}/get-var-price-claim.json", :query => {
        :claim_code => claim_code,
        :claim_view_type => 'retailer'
      }
    end
  end
end