Feature: The HCO page works correctly
  In order to make sure that the HCO feature works correctly
  As a logged-in admin user
  I want to see that the page is displayed correctly and that it can process transactions

  Background:
    Given that the admin user is logged-in
      And an item can be added to the shopping cart
      And I click on the "FT2 PP" button
      And I see "Roberto's FT2 Payment Page" displayed on the PP

    Scenario Outline: <Test Case ID> Perform successful transactions for entitled cards.
      When enter the "<Test Case ID>" as the Cardholder Name
       And I do a purchase with my "<card>" credit card
       And I enter a future "<date>" in the mmyy format as the Expiry Date
       And I enter a test Security Code like "123"
       And I click on the payment button
      Then I should see the "<result>" on the receipt
       And I should be able to leave the receipt view
       And I should be able to log out
       And I should see "Logged out successfully." displayed on the page

    Examples: <Test Case ID> Perform successful transaction type for card <card>
      | Test Case ID           | transaction type | result   | type       | card             | date |
      | QA-339-HCO-010-010-010 | Purchase         | Approved | mastercard | 2223000048400011 | 0816 |
      | QA-339-HCO-010-010-011 | Purchase         | Approved | mastercard | 2223000148400010 | 0916 |
      | QA-339-HCO-010-010-012 | Purchase         | Approved | mastercard | 2222400050001239 | 1016 |
      | QA-339-HCO-010-010-013 | Purchase         | Approved | discover   | 6250941006528599 | 1116 |
      | QA-339-HCO-010-010-014 | Purchase         | Approved | discover   | 6282000123842342 | 1216 |
     #| QA-339-HCO-010-020-010 | Pre-Auth         | Approved | mastercard | 2223000048400011 | 0517 |
     #| QA-339-HCO-010-020-011 | Pre-Auth         | Approved | mastercard | 2223000148400010 | 0821 |
     #| QA-339-HCO-010-020-012 | Pre-Auth         | Approved | mastercard | 2222400050001239 | 0925 |
     #| QA-339-HCO-010-020-013 | Pre-Auth         | Approved | discover   | 6250941006528599 | 0322 |
     #| QA-339-HCO-010-020-014 | Pre-Auth         | Approved | discover   | 6282000123842342 | 1225 |
