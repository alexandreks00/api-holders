# module HeaderSensedia
class HeaderSensedia

    def header_sensedia
        @headers = {
        'access_token' => $access_token_emissor, 
        'client_id' => $client_id,
        'Content-Type'  => 'application/json'
        }
    end 
end