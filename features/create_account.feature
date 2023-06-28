Feature: account creation

  Background:
    Given Create Account Page: I am on the account creation page
    When Create Account Page: I click on status
    When Create Account Page: I click on "agree with terms and conditions"
    When Create Account Page: I click on "all preferences"

  @create_account @simple_account
  Scenario Outline: From the create account page, check that you can't create an account when providing incorrect incorrect credentials
    When Create Account Page: I insert the surname "<surname>" , name "<name>", email "<email>" , password "<password>"
    When Create Account Page: I click on "agree with terms and conditions"
    When Create Account Page: I click the create account button
    Then Create Account Page: I cannot create an account and I receive an error "<error_message>"
    Examples:
      | surname  |   name     | email                 | password           | error_message                                                                                                                             |
      | Johnny   | Nebunu     | JohnyNebunu@mail.com  | DacaMaiBeauUnPahar | Un utilizator cu adresa de e-mail exista deja. Va rugam sa verificati informatiile cu exactitate sau introduceti o alta adresa de e-mail. |
      | Florin   | Stoian     | aniimeifrumosi.com    | EuNasVreaSaPlece   | Adresa de e-mail nu este corecta                                                                                                          |
      | Adrian   | Simionescu | ...............       | AsaSuntZileleMele  | Adresa de e-mail nu este corecta                                                                                                          |

  @create_account  @special_account
  Scenario Outline: From the create account page, check that you can't create an account using special characters on surname and name
     When Create Account Page: I insert the surname with special characters "<surname>" , name with special characters "<name>", email "<email>" , password "<password>"
     When Create Account Page: I click the create account button
     When New Create Account Page: I will be sent to another page where an error alert/box will appear but with no actual error inside it
     Then New Create Account Page: we insert special characters to the name "-%&*&$#" and to the surname "$#$#$#" again and we finally receive the error "<error_message>"
    Examples:
      | surname  |   name     | email                 | password           | error_message                             |
      | -%&*&$#  | $#$#$#     | JohnyNebunu@mail.com  | DacaMaiBeauUnPahar | Only alphanumeric characters are allowed. |