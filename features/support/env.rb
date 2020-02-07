require 'rspec'
require 'httparty'
require 'cucumber'
require 'mysql2'
require 'json'
require 'pry'
require 'base64'
require 'faker'
require 'cpf_faker'


Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

ENV['ENV'] = 'hml' unless ENV.key? 'ENV'


ENVIRONMENT = YAML.load_file('./base_uri.yml')[ENV['ENV']]

puts "Rodando em #{[ENV['ENV']]}"

class Http
    include HTTParty
    include RSpec::Matchers

    base_uri ENVIRONMENT['api']
    format :json
end

class Token
    def initialize
      $client_id = "c4ddaab1-6d37-3aa8-bf06-f737dff94bbb"
      @authorization = "Basic YzRkZGFhYjEtNmQzNy0zYWE4LWJmMDYtZjczN2RmZjk0YmJiOjZmZTNlYTQxLWRlODItMzU4OS1hNDQ3LTc3ZDI5ZTYzMmIwZA=="
      @grant_type = "password"
  
      @userEmissor = {
        :username => "api-pagamentos",
        :password => "apipagamentos",
      }
  
      @userIntermediario = {
        :username => "cielo_hml",
        :password => "DTvheEaQr3T9",
      }
    end
  
    def gera_token_emissor
      @response1 = Http.post("/oauth-b2b/v1/oauth/token",
                             :body => @userEmissor,
                             :headers => {
                               "Authorization" => @authorization,
                               "client_id" => $client_id,
                               "grant_type" => @grant_type,
                             })
  
      return @response1.parsed_response["access_token"]
    end
end
$access_token_emissor = Token.new.gera_token_emissor
puts $access_token_emissor
