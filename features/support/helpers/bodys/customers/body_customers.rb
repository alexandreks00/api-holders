# module BodyCustomers
class Body
    def body_postCustomers(name, birth_date, tax_id, intermediary_id, modality_id, id_configuracao_cartao)
        $body = {
            "name": name,
            "tax_id": $tax_id,
            "birth_date": birth_date,
            "email": "alexandre.shimizu@cateno.com.br",
            "mother_name": "Pereira",
            "genre": "M",
            "identity_number": "45655",
            "identity_agent": "ssp",
            "identity_state": "SP",
            "identity_shipping_date": "2010-10-10",
            "card_configuration": {
                "id": "#{id_configuracao_cartao}"
            },
            "marital_status": {
                "id": 7
            },
            "career": {
                "id": 2
            },
            "career_type": {
                "id": 2
            },
            "nationality": {
                "id": 1
            },
            "modality": {
                "id": "#{modality_id}"
            },
            "addresses": [
                {
                    "zip_code": "06420130",
                    "country": "Brasil",
                    "state": "SP",
                    "city": "Barueri",
                    "street": "Avenida Henrique Gonçalves Baptista",
                    "number": 2245,
                    "locality": "Jardim Belval",
                    "correspondence": true,
                    "address_type": {
                        "id": 1
                    }
                }
            ],
            "phones": [
                {
                    "ddd": "011",
                    "phone": "981374458",
                    "phone_type": {
                        "id": 18
                    }
                }
            ]
        }.to_json
    end

    def body_postCompanies(company_name, founding_date, tax_id, intermediary_id, modality_id, id_configuracao_cartao)
        $body = {
            "company_name": company_name,
            "fantasy_name": "ITAU UNIBANCO S.A",
            "tax_id": tax_id,
            "founding_date": founding_date,
            "email": "alexandre.shimizu@cateno.com.br",
            "state_registration": "SP",
            "modality": {
              "id": 201
            },
            "card_configuration": {
              "id": 340
            },
            "addresses": [
              {
                      "zip_code": "06420130",
                      "country": "Brasil",
                      "state": "SP",
                      "city": "Barueri",
                      "street": "Avenida Henrique Gonçalves Baptista",
                      "number": 2245,
                      "locality": "Jardim Belval",
                      "correspondence": true,
                      "address_type": {
                          "id": 1
                      }
              }
            ],
            "phones": [
              {
                "ddd": "011",
                "phone": "972611603",
                "phone_type": {
                  "id": 18
                }
              }
            ],
               "partners": [
              {
                "email": "alexandre.shimizu@cateno.com.br",
                "name": "DIOGO DE LIMA PAIVA",
                "tax_id": "29942590870",
                "birth_date": "1980-09-30"
              }
            ]
            
          }.to_json
    end

    
end