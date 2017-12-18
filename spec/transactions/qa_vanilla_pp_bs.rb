# This version of the qa_vanilla_pp test was created because the original test was taking too long on BrowserStack Automate (BSA), so this version reduces it to its minimum.
# Running time locally: 41.55 seconds (rspec spec/transactions/qa_vanilla_pp_bs.rb)
# Running time locally: 42.55 seconds (with bundle exec rake single)
# Running time in BSA: 3 minutes 0 seconds

require 'rails_helper.rb'
require 'test_data'


class TheData
  extend TestData
end


feature 'Processing a set of transactions through the QA Vanilla PP' do

  scenario 'can process a set of transactions' do

    # puts TheData.pp_data
    TheData.pp_data.each do |set|

      # visit("/now")
      visit("https://payment-page-develop.herokuapp.com/now")

      expect(page).to have_selector(:link_or_button, "FD QA - Vanilla",                  count: 1)

      click_button "FD QA - Vanilla"

      expect(page).to have_content("QA PP Q23378-63 Vanilla",                            count: 2)
      # expect(page).to have_content("Invoice No.:",                                       count: 1)
      # expect(page).to have_content("P.O. No.:",                                          count: 1)
      # expect(page).to have_content("Not Applicable",                                     count: 2)
      # expect(page).to have_content("Review Your Order",                                  count: 1)
      expect(page).to have_content("Total Amount:",                                      count: 1)
      expect(page).to have_content("USD",                                                count: 1)
      # expect(page).to have_content("#{@total}",                                          count: 1)
      # expect(page).to have_content("Pay With Your Credit Card",                          count: 1)
      # expect(page).to have_content("Cardholder Name",                                    count: 1)
      # expect(page).to have_content("Credit Card Number",                                 count: 1)
      # expect(page).to have_content("Expiry Date (MMYY)",                                 count: 1)
      # expect(page).to have_content("Email",                                              count: 1)
      # expect(page).to have_content("A confirmation email will be sent to this address.", count: 1)
      # expect(page).to have_content("Your private information is secured using SSL (Secure Sockets Layer), the leading security protocol on the Internet. Information is encrypted and exchanged with an https server.", count: 1)
      # expect(page).to have_content("We respect your privacy. We will pass your name, address or e-mail address on only to the merchant.", count: 1)
      # expect(page).to have_content("Secure Payment provided by First Data Corp.",        count: 1)

      fill_in "exact_cardholder_name", with: "#{set[:pp_name]}"
      fill_in "x_card_num",            with: "#{set[:pp_ccnum]}"
      fill_in "x_exp_date",            with: "#{set[:pp_date]}"
      fill_in "cc_email",              with: "#{set[:pp_email]}"

      click_button "Pay With Your Credit Card"

      # expect(page).to have_content("", count: 1)
      expect(page).to have_content("Your Order",                                        count: 1)
      # expect(page).to have_selector(:link_or_button, "Print This Page",                 count: 1)
      # expect(page).to have_content("Total Amount:",                                     count: 1)
      expect(page).to have_content("USD",                                               count: 2)
      expect(page).to have_content("This order is now complete. Transaction approved!", count: 1)
      # expect(page).to have_content("Here is your receipt:",                             count: 1)
      expect(page).to have_content("This transaction was processed in test mode.",      count: 1)
      # expect(page).to have_content("========== TRANSACTION RECORD ==========",          count: 1)
      expect(page).to have_content("TYPE: Purchase",                                    count: 1)
      # expect(page).to have_content("ACCT:",                                             count: 1)
      # expect(page).to have_content("#{set[:pp_brand]}",                                 count: 1)
      # expect(page).to have_content("#{@total}",                                         count: 2)
      expect(page).to have_content("CARDHOLDER NAME : #{set[:pp_name]}",                count: 1)
      # expect(page).to have_content("CARD NUMBER     : ",                                count: 1)
      # expect(page).to have_content("DATE/TIME       : ",                                count: 1)
      # expect(page).to have_content("REFERENCE #     : ",                                count: 1)
      # expect(page).to have_content("AUTHOR. #       : ",                                count: 1)
      # expect(page).to have_content("TRANS. REF.     : ",                                count: 1)
      expect(page).to have_content("Approved - Thank You 100",                          count: 1)
      # expect(page).to have_content("Please retain this copy for your records.",         count: 1)
      # expect(page).to have_content("Cardholder will pay above amount to card issuer pursuant to cardholder agreement.", count: 1)
      # expect(page).to have_content("========================================",          count: 1)
      # expect(page).to have_content("Secure Payment provided by First Data Corp.",       count: 1)
      # expect(page).to have_selector(:link_or_button, "See Received Values",             count: 1)

    end

  end

end
