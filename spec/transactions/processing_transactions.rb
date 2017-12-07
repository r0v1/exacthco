require 'rails_helper.rb'

feature 'Processing transactions' do

  scenario 'can process transactions' do
    # visit '/'
    visit("http://payme.onl")
    expect(page).to have_content("Shop")
    expect(page).to have_content("Cart")
    expect(page).to have_content("Transactions")
    click_link "Log In"
    fill_in 'user_username', with: Rails.application.secrets.admin_user
    fill_in 'user_password', with: Rails.application.secrets.admin_password
    expect(page).to have_content("Sign up")
    expect(page).to have_content("Forgot your password?")
    click_button "Log in"
    # expect(page).to have_content('Logged in as #{Rails.application.secrets.admin_user}')
    expect(page).to have_content("Logged in as")
    # expect(page).to have_content("Log Out")
    expect(page).to have_selector(:link_or_button, "Log Out", visible: true)
    expect(page).to have_selector(:link_or_button, "Add a new Product", count: 1)

    expect(page).to have_content("White & Black Soccer Ball", count: 1)
    expect(page).to have_content("Because everybody else is playing soccer!", count: 1)
    expect(page).to have_content("Unit Price: $35", count: 1)
    expect(page).to have_content("Product ID: 2", count: 1)

    expect(page).to have_content("Blue Skateboard", count: 1)
    expect(page).to have_content("Get into a slippery slope and use this product to generate an unsuccessful transaction.", count: 1)
    expect(page).to have_content("Unit Price: $5200", count: 1)
    expect(page).to have_content("Product ID: 3", count: 1)

    expect(page).to have_content("The classical Rubik'\u0019s Cube ¤, ¦, ¨, ´, ¸, ¼, ½, and ¾", count: 1)
    expect(page).to have_content("Because everybody else is playing soccer!", count: 1)
    expect(page).to have_content("Unit Price: $20", count: 1)
    expect(page).to have_content("Product ID: 1", count: 1)

    expect(page).to have_selector(:link_or_button, "Show", count: 3)
    expect(page).to have_selector(:link_or_button, "Edit", count: 4)
    expect(page).to have_selector(:link_or_button, "Destroy", count: 3)
    expect(page).to have_selector(:link_or_button, "Add to Cart", count: 3)

    expect(page).to have_selector(:link_or_button, "See your Cart", count: 1)

    # click_button 'Add to Cart'
    # click_link('Add to Cart', href: '/cart/more/2')
    click_link("Add to Cart", match: :first)
    # find(:xpath, "//a[@href='/cart/more/2']").click

    expect(page).to have_selector(:link_or_button, "Empty your Cart", count: 1)

    expect(page).to have_content("White & Black Soccer Ball", count: 1)
    expect(page).to have_content("Unit Price: $35", count: 1)
    expect(page).to have_content("Quantity: 1", count: 1)
    expect(page).to have_content("Sub-Total: $35", count: 1)
    expect(page).to have_content("-1", count: 1)
    expect(page).to have_content("+1", count: 1)
    expect(page).to have_content("Add other items to your cart", count: 1)

    expect(page).to have_content("Your cart's total: $35", count: 1)
    expect(page).to have_selector(:link_or_button, "Continue Shopping", count: 1)
    expect(page).to have_content("Checkout with E­-xact's Payment Page Demo", count: 1)
    expect(page).to have_content("Checkout with PayEezy's Payment Pages", count: 1)
    expect(page).to have_content("Click here to get a test credit card number.", count: 1)

    click_button "FD OMA QA - Vanilla"

    expect(page).to have_content("Review Your Order", count: 1)
    expect(page).to have_content("Total Amount:", count: 1)
    expect(page).to have_content("Pay With Your Credit Card", count: 1)
    expect(page).to have_content("Cardholder Name", count: 1)
    expect(page).to have_content("Credit Card Number", count: 1)
    expect(page).to have_content("Expiry Date (MMYY)", count: 1)
    expect(page).to have_content("Email", count: 1)
    expect(page).to have_content("A confirmation email will be sent to this address.", count: 1)
    expect(page).to have_content("Your private information is secured using SSL (Secure Sockets Layer), the leading security protocol on the Internet. Information is encrypted and exchanged with an https server.", count: 1)
    expect(page).to have_content("We respect your privacy. We will pass your name, address or e-mail address on only to the merchant.", count: 1)
    expect(page).to have_content("Secure Payment provided by First Data Corp.", count: 1)

    fill_in "exact_cardholder_name", with: "HCO automated VISA test"
    fill_in "x_card_num", with: "4111111111111111"
    fill_in "x_exp_date", with: "1222"
    fill_in "cc_email", with: "email@example.com"

    click_button "Pay With Your Credit Card"

    # expect(page).to have_content("", count: 1)
    expect(page).to have_content("Your Order", count: 1)
    expect(page).to have_selector(:link_or_button, "Print This Page", count: 1)
    expect(page).to have_content("This order is now complete. Transaction approved!", count: 1)
    expect(page).to have_content("Here is your receipt:", count: 1)
    expect(page).to have_content("This transaction was processed in test mode.", count: 1)
    expect(page).to have_content("========== TRANSACTION RECORD ==========", count: 1)
    expect(page).to have_content("TYPE: Purchase", count: 1)
    expect(page).to have_content("ACCT:", count: 1)
    expect(page).to have_content("$ 35.00", count: 1)
    expect(page).to have_content("CARDHOLDER NAME : HCO automated VISA test", count: 1)
    expect(page).to have_content("CARD NUMBER     : ############1111", count: 1)
    expect(page).to have_content("DATE/TIME       :", count: 1)
    expect(page).to have_content("REFERENCE #     :", count: 1)
    expect(page).to have_content("AUTHOR. #       :", count: 1)
    expect(page).to have_content("TRANS. REF.     :", count: 1)
    expect(page).to have_content("Approved - Thank You 100", count: 1)
    expect(page).to have_content("Please retain this copy for your records.", count: 1)
    expect(page).to have_content("Cardholder will pay above amount to card issuer pursuant to cardholder agreement.", count: 1)
    expect(page).to have_content("========================================", count: 1)
    expect(page).to have_content("Secure Payment provided by First Data Corp.", count: 1)

  end

end
