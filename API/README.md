# Desafio de Automação de Testes de API em Ruby e Httparty+Rspec

Este projeto realiza a automação de testes na página web enviada, utilizando o framework Playwright
A automação consiste em clicar em todos os 3 botões na tela, e clicar em todos os botões 'edit' e 'delete' da tabela.

## Configuração

Para executar este projeto, siga as instruções abaixo:

1. Instale as dependências do Python:

    gem install rspec httparty json-schema faker logger json

2. Execute o teste com o comando:
    rspec `api_spec.rb`

## Funcionalidades

- GET /users: Verifica se a requisição retorna o código 200 e se o corpo da resposta está de acordo com o schema JSON esperado.
- POST /users: Verifica se a requisição de criação de usuário retorna o código 201 e se o corpo da resposta está de acordo com o schema JSON esperado.
- PUT /users/:id: Verifica se a requisição de atualização de usuário retorna o código 200 e se o corpo da resposta está de acordo com o schema JSON esperado.
- DELETE /users/:id: Verifica se a requisição de exclusão de usuário retorna o código 200 e se o corpo da resposta está de acordo com o schema JSON esperado.
- GET /users/:id (Bad Request): Verifica se a requisição com ID inválido retorna o código 404 e se o corpo da resposta está de acordo com o schema JSON esperado.
- POST /users (Bad Request): Verifica se a requisição de criação de usuário com dados inválidos retorna o código 404 e se o corpo da resposta está de acordo com o schema JSON esperado.
- PUT /users (Bad Request): Verifica se a requisição de atualização de usuário sem ID retorna o código 404 e se o corpo da resposta está de acordo com o schema JSON esperado.

## Logs

- Os logs das requisições e respostas são salvos no arquivo logfile.log.

