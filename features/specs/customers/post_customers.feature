# language: pt
# encoding: utf-8

Funcionalidade: Customers

@run
Esquema do Cenario: Post Customer
    Dado usuario logado como emissor
    E os dados do novo portador "<name>" "<tax_id>" "<birth_date>" "<modality_id>" "<intermediary_id>"
    Quando faco uma solicitacao POST para o servico Holders
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E a portador cadastrado no banco de dados
    
      Exemplos:
          |modality_id|intermediary_id|name                   |tax_id     |birth_date|status_code|
          |201        |25             |ALEXANDRE KENJI SHIMIZU|34266611870|1995-05-02|201        | 
          
@run
Esquema do Cenario: Post Companies
    Dado usuario logado como emissor
    E os dados do novo portador "<name>" "<tax_id>" "<birth_date>" "<modality_id>" "<intermediary_id>"
    Quando faco uma solicitacao POST para o servico Holders
    Entao o codigo de resposta HTTP deve ser igual "<status_code>"
    E a portador cadastrado no banco de dados
    
      Exemplos:
          |modality_id|intermediary_id|name        |tax_id            |birth_date  |status_code |
          |61         |25             |ITAU        |60701190296461    |2002-09-12  |201         | 