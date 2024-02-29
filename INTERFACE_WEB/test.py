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

    rows = page.query_selector_all("tbody tr")
    for row in rows:
        links_delete = row.query_selector('a[href="#delete"]')
        links_edit = row.query_selector('a[href="#edit"]')
        links_delete.click()
        logging.info(f'pagina atual: {page.url}')
        assert "delete" in page.url, "A URL não contém 'delete'"
        links_edit.click()
        logging.info(f'pagina atual: {page.url}')
        assert "edit" in page.url, "A URL não contém 'edit'"
    browser.close()