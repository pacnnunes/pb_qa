require 'rspec'
require 'httparty'
require 'json-schema'
require 'logger'
require_relative 'mock'
require_relative 'api_metodos'

url = 'http://jsonplaceholder.typicode.com/users'
bad_url = "#{url}/999"
code_ok = 200
code_create = 201
code_badRequest = 404
user = 1
mockClient = Mock.new
apiClient = ApiMetodos.new
logger = Logger.new('logfile.log')

RSpec.describe 'Testes da API PB ' do
  it 'Validar GET / Deve retornar 200' do
    logger.info('Iniciando teste')
    response = HTTParty.get(url) 
    logger.info("Requisição realizada, status code: #{response.code}")
    expect(response.code).to eq(code_ok)
    logger.info(response.body)
    apiClient.validate_schema("./get_schema_json.json",response.body)
  end

  it 'Validar POST / Deve retornar 201' do
    apiClient = ApiMetodos.new
    logger.info('Iniciando teste')
    response = HTTParty.post(url, body: mockClient.create_payload_default.to_json, headers: {'Content-Type'=> 'application/json' })
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_create)
    response =response.body
    apiClient.validate_schema("./post_schema_json.json",response)
  end
  it 'Validar PUT / Deve retornar 200' do
    response = HTTParty.put("#{url}/#{user}", body: mockClient.put_payload_default.to_json, headers: {'Content-Type'=> 'application/json'})
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_ok)
    response =response.body
    apiClient.validate_schema("./put_schema_json.json",response)
  end
  it 'Validar DELETE / Deve retornar 200' do
    response = HTTParty.delete("#{url}/#{user}")
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_ok)
    response =response.body
    apiClient.validate_schema("./delete_schema_json.json",response)
    end
  it 'Bad Request GET / Deve retornar 404' do
    response = HTTParty.get(bad_url)
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_badRequest)
    response =response.body
    apiClient.validate_schema("./get_schema_404.json",response)
    end
  it 'Bad Request POST / Deve retornar 404' do
    response = HTTParty.post(bad_url, body: mockClient.create_payload_default.to_json, headers: {'Content-Type'=> 'application/json' })
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_badRequest)
    response =response.body
    apiClient.validate_schema("./post_schema_404.json",response)
    end
  it 'Bad Request PUT / Deve retornar 404' do
    response = HTTParty.put(url, headers: {'Content-Type'=> 'application/json'})
    logger.info("Requisição realizada, status code: #{response.code}")
    logger.info(response.body)
    expect(response.code).to eq(code_badRequest)
    response =response.body
    apiClient.validate_schema("./put_schema_404.json",response)
    end

end