# module HeaderCards
class HeaderCards
    def header_post_cards(id_account)
        @headers = {
        'access_token' => $access_token, 
        'client_id' => 'cd2411c6-3312-3b8f-82ce-b1262c5deb1d',
        'id_account' => id_account,
        'virtual_card' => "true"
        }
    end 

    def header_put_cardsPassword(password)
        @headers = {
        'access_token' => $access_token, 
        'client_id' => 'cd2411c6-3312-3b8f-82ce-b1262c5deb1d',
        'password' => password
        }
    end 

end