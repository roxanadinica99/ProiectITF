from selenium import webdriver
from selenium.webdriver.common.by import By
from webdriver_manager.chrome import ChromeDriverManager
# x_newsletter = "/html/body/div[3]//div/button/svg"
# with open(file_path, 'w', encoding='utf-8') as f:
#     f.write(html_content)


# here we have the browser class which is inherited in the Base_page class, in this class we have the webdriver
class Browser():
    chrome = webdriver.Chrome(executable_path=ChromeDriverManager().install()) # this adds updates to chrome in case there are any
    chrome.maximize_window() # this maximizes the window
    chrome.get('https://www.elefant.ro/') # this sends us to the url
    chrome.implicitly_wait(10) # I've set an implicit wait of 10 seconds because the site is very sluggish, the code in it loads very slowly and in some cases I disabled this and added an explicit wait
    try:
        chrome.find_element(By.XPATH, '//*[@id="CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll"]').click()
    except:
        pass
    # sometimes the cookies message won't appear

    # ths method quits the browser
    def close_browser(self):
        self.chrome.quit()