
Quando("faco uma solicitacao POST para o servico Holders") do

    if @tipo_portador == PF
        @response = Request.new.post_customers($body, 
                HeaderSensedia.new.header_sensedia) 
    else 
        @response = Request.new.post_Companies($body, 
                    HeaderSensedia.new.header_sensedia) 
    end         
end

Entao("a portador cadastrado no banco de dados") do
    Cadastro.isCadastrado(@response["id"], @tipo_portador)
end



Dado("os dados do novo portador {string} {string} {string} {string} {string}") do |name, tax_id, birth_date, modality_id, intermediary_id|
   
    Cadastro.new.assign(name, tax_id, birth_date, modality_id, intermediary_id) 
    @tipo_portador = Cadastro.new.isCpf(Cadastro.tax_id)
    @id_configuracao_cartao = Cadastro.new.pre_modalidade(modality_id)
   

    if @tipo_portador
            @tipo_portador = "PF"
            Cadastro.pre_portador(Cadastro.tax_id, @tipo_portador)
            $body = Body.new.body_postCustomers(Cadastro.name, Cadastro.birth_date, 
            Cadastro.tax_id, Cadastro.intermediary_id, 
            Cadastro.modality_id, @id_configuracao_cartao)
        
    else
            @tipo_portador = "PJ"        
            portador.pre_portador(Cadastro.tax_id, @tipo_portador)
            $body = Body.new.body_postCompanies(Cadastro.name, Cadastro.birth_date, 
            Cadastro.tax_id, Cadastro.intermediary_id, 
            Cadastro.modality_id, @id_configuracao_cartao)
    end                  
end
   
Entao("o codigo de resposta HTTP deve ser igual {string}") do |code|
    expect(@response.code).to eql code.to_i
end

Dado("usuario logado como emissor") do
    @access_token = $access_token_emissor
end