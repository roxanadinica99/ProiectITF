Feature: check the functionality of the search function

  Background:
    Given Main Page: I am on the elefant.ro main page
#

    @search @search_products
    Scenario Outline: test search functionality
      When Main Page: In search bar I search for "<product>"
      Then Products Page: I see the results "<search_results>" that contains "<product>"
      Examples:
        | product           | search_results               |
        | festina           | //a[@class="product-title"]  |
        | harry potter      | //a[@class="product-title"]  |
        | iphone            | //a[@class="product-title"]  |


    @search @add_searched_products
    Scenario Outline: test that products are added to and removed from the basket
      When Main Page: In search bar I search for "<product>"
      When Products Page: I click on the product "<search_results>"
      When Cart Page: I am on the cart page and I click add to basket
      When Cart Page: I see message "<added_to_cart_message>" and then I click on see basket
      When Checkout Page: I am on the checkout page and I click to remove the product
      When Checkout Page: I see message "<removed_from_cart_message>" and I click on continue shopping
      Then Main Page: I am on the main page
      Examples:
        | product           | search_results               | added_to_cart_message          | removed_from_cart_message        |
        | festina           | //a[@class="product-title"]  | PRODUSUL A FOST ADAUGAT IN COS | NU EXISTA NICI UN PRODUS IN COS. |
        | harry potter      | //a[@class="product-title"]  | PRODUSUL A FOST ADAUGAT IN COS | NU EXISTA NICI UN PRODUS IN COS. |
        | iphone            | //a[@class="product-title"]  | PRODUSUL A FOST ADAUGAT IN COS | NU EXISTA NICI UN PRODUS IN COS. |