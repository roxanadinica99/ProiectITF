from browser import Browser

# in this class we will create certain methods that can be reused/called in pages
class Base_page(Browser):

    # the following method verifies the error message
    def check_error_message(self, by, selector, expected_error_message):
        actual_error_message = self.chrome.find_element(by, selector).text.replace('ă', 'a').replace('ț', 't').replace('î','i').replace('â', 'a').replace('ș','s').replace('Ă','A').replace('Ț','T').replace('Î','I').replace('Â','A').replace('Ș','S')
        # we use the replace method on those special characters from the romanian alphabet because otherwise I would receive an UnicodeEncode error, and the HTML report would not be generated
        assert expected_error_message in actual_error_message, f'Error, expected {expected_error_message}, ' \
                                                               f'but got {actual_error_message} instead'