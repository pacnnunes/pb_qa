require 'json'
require 'logger'

class ApiMetodos
  def validate_schema(schema, response)
    logger = Logger.new('logfile.log')
    resultado = JSON::Validator.fully_validate(schema,response)
    p(resultado)
    if resultado.any?
      logger.info("Schema Inválido")
      raise StandardError.new
    else
      logger.info("Schema Válido")
    end
  end
end
