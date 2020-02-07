class Request
    def get_customers_queryParams(name, taxId, headers)
        Http.get("/prepay/v2/customers?name=#{name}&taxId=#{taxId}", 
        :headers => headers)
    end

    def get_customers_customerId(customerId, headers)
        Http.get("/prepay/v2/customers/#{customerId}", 
        :headers => headers)
    end

    def get_customers_accounts(customerId, headers)
        Http.get("/prepay/v2/customers/#{customerId}/accounts", 
        :headers => headers)
    end


    def post_customers(body, headers)
        Http.post("/prepay-holder/v1/intermediaries/#{Holders.intermediary_id}/customers/", 
        :headers => headers,
        :body => $body)
    end

    def post_companies(body, headers)
        Http.post("/prepay-holder/v1/intermediaries/#{Holders.intermediary_id}/companies/", 
        :headers => headers,
        :body => $body)
    end

    def put_customers_address(customerId, addressId, body, headers)
        Http.put("/prepay/v2/customers/#{customerId}/addresses/#{addressId}", 
        :headers => headers,
        :body => body)
    end

    def put_customers_phone(customerId, phoneId, body, headers)
        Http.put("/prepay/v2/customers/#{customerId}/phones/#{phoneId}", 
        :headers => headers,
        :body => body)
    end

    def put_customers(customerId, body, headers)
        Http.put("/prepay/v2/customers/#{customerId}/", 
        :headers => headers,
        :body => body)
    end
end 