Feature: The HCO page works correctly
  In order to make sure that the HCO feature works correctly
  As a logged-in admin user
  I want to see that the page is displayed correctly and that it can process transactions

  Background:
    Given that the admin user is logged-in
      And an item can be added to the shopping cart
      And I click on the "FD2 PROD" button
      And I see "Roberto's Test" displayed on the PP

    Scenario Outline: <Test Case ID> Perform successful transactions for entitled cards.
      When enter a Cardholder Name of up to thirty characters like "012345678901234567890123456789"
       And I do a purchase with my "<card>" credit card
       And I enter a future "<date>" in the mmyy format as the Expiry Date
       And I enter a test Security Code like "123"
       And I click on the payment button
      Then I should see the "<result>" on the receipt
       And I should be able to leave the receipt view
       And I should be able to log out
       And I should see "Logged out successfully." displayed on the page

    Examples: <Test Case ID> Perform successful transaction type for card <card>
      | Test Case ID       | result   | card              | date | type       |
      | HCO-PP-010-010-010 | Approved | 4111111111111111  | 1223 | visa       |
      | HCO-PP-010-010-011 | Approved | 5500000000000004  | 0125 | mastercard |
      | HCO-PP-010-010-012 | Approved | 340000000000009   | 0520 | amex       |
      | HCO-PP-010-010-013 | Approved | 3566002020140006  | 0821 | jcb        |
      | HCO-PP-010-010-014 | Approved | 6011000000000004  | 0419 | discover   |
      | HCO-PP-010-010-015 | Approved | 36438999960016    | 1118 | diners     |
