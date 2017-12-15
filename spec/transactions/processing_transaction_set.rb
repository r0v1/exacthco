require 'rails_helper.rb'

feature 'Processing a set of transactions through the PNB' do

  scenario 'can process a set of transactions' do
    # visit '/'
    visit("/pnb")

    expect(page).to have_selector(:link_or_button, "QA Pay Now Button", count: 1)

    click_button "QA Pay Now Button"

    expect(page).to have_content("F66230-11 PNB1 QA", count: 2)
    expect(page).to have_content("Please enter the amount you wish to pay:", count: 1)
    expect(page).to have_content("Amount", count: 1)
    expect(page).to have_content("USD", count: 1)
    expect(page).to have_selector(:link_or_button, "Submit", count: 1)
    expect(page).to have_selector(:link_or_button, "« Return to F66230-11 PNB1 QA", count: 1)
    expect(page).to have_content("Your private information is secured using SSL (Secure Sockets Layer), the leading security protocol on the Internet. Information is encrypted and exchanged with an https server.", count: 1)
    expect(page).to have_content("We respect your privacy. We will pass your name, address or e-mail address on only to the merchant.", count: 1)
    expect(page).to have_content("Secure Payment provided by First Data Corp.", count: 1)


    fill_in "amount", with: "10.00"
    click_button "Submit"

    expect(page).to have_content("Review Your Order", count: 1)
    expect(page).to have_content("Total Amount:", count: 1)
    expect(page).to have_content("Choose Payment Option", count: 1)
    expect(page).to have_content("Pay With Your Credit Card", count: 1)
    expect(page).to have_content("Cardholder Name", count: 1)
    expect(page).to have_content("Credit Card Number", count: 1)
    expect(page).to have_content("Expiry Date (MMYY)", count: 1)
    expect(page).to have_content("Email", count: 1)
    expect(page).to have_content("A confirmation email will be sent to this address.", count: 1)
    expect(page).to have_content("Verification", count: 1)
    # expect(page).to have_content("reCAPTCHA", count: 1)
    # expect(page).to have_content("Privacy - Terms", count: 1)
    expect(page).to have_content("Your private information is secured using SSL (Secure Sockets Layer), the leading security protocol on the Internet. Information is encrypted and exchanged with an https server.", count: 1)
    expect(page).to have_content("We respect your privacy. We will pass your name, address or e-mail address on only to the merchant.", count: 1)
    expect(page).to have_content("Secure Payment provided by First Data Corp.", count: 1)

    fill_in "exact_cardholder_name", with: "HCO automated VISA test"
    fill_in "x_card_num", with: "4111111111111111"
    fill_in "x_exp_date", with: "1222"
    fill_in "cc_email", with: "email@example.com"

    # The reCAPTCHA step will have to be done manually, unfortunately
    # check("I'm not a robot")
    sleep 10

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
    # expect(page).to have_content("$ 35.00", count: 1)
    expect(page).to have_content("CARDHOLDER NAME : ", count: 1)
    expect(page).to have_content("CARD NUMBER     : ", count: 1)
    expect(page).to have_content("DATE/TIME       : ", count: 1)
    expect(page).to have_content("REFERENCE #     : ", count: 1)
    expect(page).to have_content("AUTHOR. #       : ", count: 1)
    expect(page).to have_content("TRANS. REF.     : ", count: 1)
    expect(page).to have_content("Approved - Thank You 100", count: 1)
    expect(page).to have_content("Please retain this copy for your records.", count: 1)
    expect(page).to have_content("Cardholder will pay above amount to card issuer pursuant to cardholder agreement.", count: 1)
    expect(page).to have_content("========================================", count: 1)
    expect(page).to have_content("Secure Payment provided by First Data Corp.", count: 1)

  end

end
