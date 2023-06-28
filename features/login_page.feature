Feature: check the functionality of the login page

  Background:
        Given Login Page: I am on the elefant.ro login page

  @login @login_correct_cred
  Scenario: Check that you can login after providing correct credentials
    When Login Page: I insert the correct email "JohnyNebunu@mail.com" and the correct password "DacaMaiBeauUnPahar"
    When Login Page: I click the login button
    Then Main Page: I successfully login into the application

  @login @login_incorrect_cred
  Scenario Outline: Check that you can not login after providing incorrect credentials
    When Login Page: I insert the email "<email>" and password "<password>"
    When Login Page: I click the login button
    Then Login Page: I can not login into the application and I receive an error "<error_message>"
    Examples:
      | email                          | password           | error_message                                                                          |
      | incorrect_email                | incorrect_password | Te rugam sa introduci o adresa de e-mail valida.                                       |
      | incorrect_email@gmail.com      | incorrect_password | Adresa dumneavoastra de email / Parola este incorecta. Va rugam sa incercati din nou.  |


