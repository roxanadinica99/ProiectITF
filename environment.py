
from browser import Browser
from pages.cart_page import Cart_page
from pages.checkout_page import Checkout_page
from pages.create_account_page import Create_Account
from pages.login_page import Login_page
from pages.main_page import Main_Page
from pages.new_create_account_page import New_Create_Account_Page
from pages.products_page import Products_page
import sys
import io


# in this method we have all the objects
# this method runs before the tests
def before_all(context):
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding='utf-8') # these two lines are a fix for the encoding error UnicodeException, but sometimes they might not work
                                                                        # on win 10, the unicode error, appears fairly often, even though I added 2 fixes for it
                                                                        # the unicode error did not appear on mac os
    context.browser = Browser()
    context.main_page_object = Main_Page()
    context.login_page_object = Login_page()
    context.create_account_page_object = Create_Account()
    context.products_page_object = Products_page()
    context.cart_page_object = Cart_page()
    context.checkout_page_object = Checkout_page()
    context.new_create_account_page_object = New_Create_Account_Page()
    # here we create an object for every page
    # we use these objects in 'steps' files

# this method runs after running the tests
def after_all(context):
    context.browser.close_browser()