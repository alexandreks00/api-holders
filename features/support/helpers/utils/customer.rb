class Holders
    
    def assign(name, tax_id, birth_date, modality_id, intermediary_id)
        @@name = name
        @@tax_id = tax_id
        @@birth_date = birth_date
        @@modality_id = modality_id
        @@intermediary_id = intermediary_id.to_i
    end

    def self.name
        return @@name
    end

    def self.tax_id 
        return @@tax_id
    end

    def self.intermediary_id
        return @@intermediary_id
    end

    def self.modality_id
        return @@modality_id
    end

    def self.birth_date
        return @@birth_date
    end

end


class Cadastro < Holders
    include RSpec::Matchers

    def isCadastrado(id_portador, tipo_portador)
         MYSQL.new.consulta_portador_ativo(Holders.tax_id, tipo_portador) 
    end

    def isCpf(tax_id)
        if tax_id.length <= 11 
            return true
        else
            return false
        end   
    end

    def pre_modalidade(modality_id)
        id_configuracao_cartao = MYSQL.new.query_get_id_configuracao_cartao(modality_id)

        if !id_configuracao_cartao
            raise "Modalidade sem configuracao cartao"
        else
            return id_configuracao_cartao.to_i
        end
    end

    def pre_portador(tax_id, tipo_portador)
        @id_portador = MYSQL.new.query_verifica_cadastro_portador(tax_id, tipo_portador)

        if @id_portador 
            puts "O id_portador '#{@id_portador}' foi encontrado, realizando delete"
            MYSQL.new.query_delete_portador(@id_portador)    
        else
            puts "OK"    
        end
    end
    
end