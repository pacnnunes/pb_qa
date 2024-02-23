# Desafio de Automação de Testes Web em Python e Playwright

Este projeto realiza a automação de testes na página web enviada, utilizando o framework Playwright
A automação consiste em clicar em todos os 3 botões na tela, e clicar em todos os botões 'edit' e 'delete' da tabela.

## Configuração

Para executar este projeto, siga as instruções abaixo:

1. Instale as dependências do Python:

    pip install playwright

2. Execute o script Python `test.py`.

## Funcionalidades

- Acessa a página [https://the-internet.herokuapp.com/challenging_dom](https://the-internet.herokuapp.com/challenging_dom).
- Captura a quantidade de botões presentes na página.
- Captura screenshots de cada botão e salva na pasta `.evidencias`.
- Clica em todos os botões da página.
- Clica em todos os links com o texto "edit" e "delete".

## Logs

- Os logs das requisições e respostas são salvos no arquivo logfile.log

## Observações

- É necessario possuir o Python instalado para a execução do script
- Este projeto utiliza o navegador Chromium em modo headless (visível), para alterar, deve ser alterado o valor "headless" para 'True'.
