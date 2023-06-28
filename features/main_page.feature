Feature: check the functionality of the main page

  Background:
    Given Main Page: I am on the elefant.ro main page

  @main_page
    Scenario Outline: From the Main page, check that you can click on certain elements
      When Main Page: I click on "<element>"
      Then I am on the "<page>" and I see text "<success_text>" with text element "<text_element>"
      Examples:
        | element                                                 | page                                                        | success_text                    | text_element                                |
        | //*[@id="mobileCat-Supermarket"]/a[1]                   | https://www.elefant.ro/hp-vin-gourmet-cms-hp-vin-gourmet    | Bauturi & Gourmet               | //*[@id="filter-accordion"]/div/h3         |
        | //*[@id="mobileCat-JucariiCopiiBebe"]/a[1]              | https://www.elefant.ro/hp-jucarii-cms-hp-jucarii            | Jucarii                         | //*[@id="filter-accordion"]/div[1]/h3       |
        | //*[@id="mobileCat-Electro"]/a[1]                       | https://www.elefant.ro/list/electronice-it-tv-si-gaming     | Electronice, IT, TV si Gaming   | //*[@id="SortingRow"]/div[1]/h1             |
        | //*[@id="mobileCat-Nutritie"]/a[1]                      | https://www.elefant.ro/hp-nutritie-cms-hp-nutritie          | NUTRITIE                        | //*[@id="filter-accordion"]/div[1]/h3       |




