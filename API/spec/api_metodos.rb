require 'json'
require 'logger'

class ApiMetodos
  def validate_schema(schema, response)
    logger = Logger.new('logfile.log')
    if JSON::Validator.validate(schema, response)
      logger.info('Schema válido!')
    else
      logger.error('Schema inválido!')
    end
  end
end
