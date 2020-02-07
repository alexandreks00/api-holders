
require "mysql2"
require "rspec"
class MYSQL
  def initialize
    # Initialize connection variables.
    @HOST = String("cateno-prepago.c3ssunrkn9wn.us-east-1.rds.amazonaws.com")
    @USER_MYSQL = String("qa")
    @PASS_MYSQL = String("WJ9v65/DyEmOs1RyjKeSeg==")
    @PORT_MYSQL = String("3306")

    # Initialize connection object.
    @client = Mysql2::Client.new(
      :host => @HOST,
      :username => @USER_MYSQL,
      :password => @PASS_MYSQL,
      :database => @DATABASE_NAME,
      :port => @PORT_MYSQL,
      :connect_timeout => 30,
    )
  end

  def query_get_id_configuracao_cartao(modality_id)

    modality_id = modality_id.to_i
    @query = @client.query("SELECT id_configuracao_cartao
      FROM cateno_backoffice_modalidade.configuracao_cartao 
      WHERE id_modalidade_fk = '#{modality_id}' 
      ORDER BY id_configuracao_cartao DESC LIMIT 1")
    id_configuracao_cartao = @query.first["id_configuracao_cartao"]
    return id_configuracao_cartao
  end

  def query_verifica_cadastro_portador(tax_id, tipo_portador)
      
      tipo_portador == "PF"? 
        @query =  @client.query(
          "SELECT id_portador 
          FROM cateno_portador_cadastro.portador
          INNER JOIN cateno_portador_cadastro.portador_pf pf 
          ON pf.id_portador_fk = portador.id_portador
          WHERE pf.cpf = '#{tax_id}' and ativo = 1") :
        @query =  @client.query(
            "SELECT id_portador 
            FROM cateno_portador_cadastro.portador
            INNER JOIN cateno_portador_cadastro.portador_pj pj 
            ON pj.id_portador_fk = portador.id_portador
            WHERE pj.cnpj = '#{tax_id}' and ativo = 1")
          
      if @query 
        return @query.first["id_portador"]
      end
                                        
  end

  def query_delete_portador(id_portador) 
    @query = @client.query("
      UPDATE `cateno_portador_cadastro`.`portador` 
      SET `ativo` = '0' 
      WHERE (`id_portador` = '#{id_portador}');")
      
  end

  def consulta_portador_ativo(tax_id, tipo_portador)
    
    if tipo_portador == "PF"
      @query = @client.query("SELECT id_portador
        FROM cateno_portador_cadastro.portador
        INNER JOIN cateno_portador_cadastro.portador_pf pf ON pf.id_portador_fk = portador.id_portador
        where pf.cpf = '#{tax_id}' and portador.ativo = 1 ; ") 
      return @query.first["id_portador"]
    else
      @query = @client.query("SELECT id_portador
        FROM cateno_portador_cadastro.portador
        INNER JOIN cateno_portador_cadastro.portador_pj pj ON pj.id_portador_fk = portador.id_portador
        where pj.cnpj = '#{tax_id}' and portador.ativo = 1 ; ") 
      return @query.first["id_portador"] 

    end

  end
  
end