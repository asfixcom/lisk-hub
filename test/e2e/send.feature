Feature: Send dialog
  @testnet
  Scenario: should allow to send when enough funds and correct address form
    Given I'm logged in as "genesis"
    Then I go to "/wallet"
    And I fill in "1" to "amount" field
    Then I should see "convertor" element
    Then I should see "converted price" element with text matching coverter price
    And I fill in "23495548317450503L" to "recipient" field
    And I click "send next button"
    And I click "send button"
    And I wait 1 seconds
    Then I should see text "Transaction is being processed and will be confirmed. It may take up to 15 minutes to be secured in the blockchain." in "result box message" element

  Scenario: should be correct number of transactions in a table
    Given I'm logged in as "genesis"
    And I should see 5 rows
    When I click "seeAllLink"
    And I should see 25 rows
    When I scroll to the bottom of "transaction results"
    Then I should see 50 rows

  Scenario: should allow to send when using launch protocol
    Given I'm logged in as "genesis"
    When I go to "/wallet?recipient=4995063339468361088L&amount=5"
    Then I should see "4995063339468361088L" in "recipient" field
    And I should see "5" in "amount" field
    When I click "send next button"
    Then I click "send button"
    And I wait 1 seconds
    Then I should see text "Transaction is being processed and will be confirmed. It may take up to 15 minutes to be secured in the blockchain." in "result box message" element

  @advanced
  Scenario: should be able to init account if needed
    Given I'm logged in as "genesis"
    And I fill in "1" to "amount" field
    And I fill in "94495548317450502L" to "recipient" field
    And I click "send next button"
    And I click "send button"
    Then I go to "/"
    Then I wait 15 seconds
    And I'm logged in as "without initialization"
    Then I should see "account initialization" element
    When I click "account init button"
    And I click "send button"
    And I wait 1 seconds
    Then I should see text "Transaction is being processed and will be confirmed. It may take up to 15 minutes to be secured in the blockchain." in "result box message" element
    When I click "okay button"
    Then I should see no "account initialization"
    When I refresh the page
    Then I wait 15 seconds
    Then I should see no "account initialization"
    Then I should see 2 rows
