Feature: Display the cart page correctly when the cart is empty and no user is logged in
  In order to display the cart page correctly
  As a non-logged-in user
  I want to see all predefined strings, images and format displayed correctly

Scenario: The correct text is displayed on the cart page when the cart is empty
  Then I should see "Your cart is currently empty." displayed on the cart page
  Then I should see "Buy something!" displayed on the cart page


  Scenario Outline: The English PP is accessible from the cart page and all text labels are displayed correctly
    Given that the admin user is logged-in
      And an item can be added to the shopping cart
    When I click on the "FD2 PROD" button
    Then I should see "Roberto's Test" displayed on the PP
      And I should see "Review Your Order" displayed on the PP
      And I should see "Invoice No.:" displayed on the PP
      And I should see "P.O. No.:" displayed on the PP
      And I should see "Quantity" displayed on the PP
      And I should see "Item" displayed on the PP
      And I should see "Unit" displayed on the PP
      And I should see "Price" displayed on the PP
      And I should see "Shipping" displayed on the PP
      And I should see "Tax" displayed on the PP
      And I should see "USD" displayed on the PP
      And I should see "Total" displayed on the PP
      And I should see "Return to Roberto's Test" displayed on the PP
      And I should see "Choose Payment Option" displayed on the PP
      And I should see "Pay With Your Credit Card" displayed on the PP
      And I should see "Cardholder Name" displayed on the PP
      And I should see "Expiry Date (MMYY)" displayed on the PP
      And I should see "Security Code" displayed on the PP
      And I should see "CVV2 is the Visa term for the 3-digit security code on the back of the credit card (Visa and MasterCard). For American Express, it is 4-digits and located on the front." displayed on the PP
      And I should see "Address" displayed on the PP
      And I should see "City" displayed on the PP
      And I should see "State/Province" displayed on the PP
      And I should see "ZIP/Postal Code" displayed on the PP
      And I should see "Country" displayed on the PP
      And I should see "Email" displayed on the PP
      And I should see "Verification" displayed on the PP
      And I should see "A confirmation email will be sent to this address." displayed on the PP
      And I should see "Verification" displayed on the PP
      And I should see "I'm not a robot" displayed on the PP
      And I should see "Your private information is secured using SSL (Secure Sockets Layer), the leading security protocol on the Internet. Information is encrypted and exchanged with an https server." displayed on the PP
      And I should see "We respect your privacy. We will pass your name, address or e-mail address on only to the merchant." displayed on the PP
      And I should see "Secure Payment provided by First Data Corp." displayed on the PP
