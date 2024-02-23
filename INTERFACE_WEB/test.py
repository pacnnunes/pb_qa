import time
import logging
from playwright.sync_api import sync_playwright

logging.basicConfig(filename='logfile.log', level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

with sync_playwright() as p:
    browser = p.chromium.launch(headless=False)
    page = browser.new_page()
    page.goto('https://the-internet.herokuapp.com/challenging_dom')
    logging.info(f'Acessando a Pagina{page}')
    time.sleep(2)

    botao_pb = page.query_selector_all('.button')
    num_botoes_pb = len(botao_pb)
    logging.info(f'Numero de botoões encontrados: {num_botoes_pb}')

    for i in range(num_botoes_pb):
        time.sleep(0.5)
        botao = page.locator('.button').nth(i)
        logging.info(f'encontrado o botão {botao}')
        botao.screenshot(path=f'.evidencias/screenshots{i}.png')
        logging.info('salvando a evidência')
        time.sleep(2)
        botao.click()

    links_delete = page.query_selector_all('a[href="#edit"]')
    for link in links_delete:
        if link.is_visible():
            print(link)
            link.click()
            logging.info(f'clicando no link: {link}')

    links_edit = page.query_selector_all('a[href="#delete"]')
    for link in links_edit:
        if link.is_visible():
            print(link)
            link.click()
            logging.info(f'clicando no link: {link}')


    browser.close()