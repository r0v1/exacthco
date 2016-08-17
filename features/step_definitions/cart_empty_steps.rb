# require 'rubygems'
# require 'watir-webdriver'
browser = Watir::Browser.start "https://payment-page-demo.herokuapp.com/cart", :firefox
sleep 2
Then(/^I should see "([^"]*)" displayed on the cart page$/) do |arg1|
  unless browser.text.include? "Your cart is currently empty."
    fail
  end
  unless browser.text.include? "Buy something!"
    fail
  end
end
