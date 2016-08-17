browser             = Watir::Browser.new :firefox
your_admin_username = Rails.application.secrets.admin_user
your_admin_password = Rails.application.secrets.admin_password

def login(browser, your_admin_username, your_admin_password)
  browser.goto 'https://payment-page-demo.herokuapp.com/'
  browser.link(text: 'Log In').click
  sleep 1
  browser.text_field(id: 'user_username').set(your_admin_username)
  browser.text_field(id: 'user_password').set(your_admin_password)
  browser.button(value: 'Log in').click
end

def goto_pp(browser, your_admin_username, your_admin_password)
  browser
  your_admin_username
  your_admin_password
  login(browser, your_admin_username, your_admin_password)
  sleep 1
  browser.link(text: 'Add to Cart').click
  sleep 1
  browser.button(value: "FD2 PROD").click
end

def leave_receipt_view
  browser.button(value: 'Back to the Payment Page Demo Site').click
end

def log_out
  browser.button(value: 'Log out').click
  unless browser.text.include? 'Logged out successfully.'
    puts "You did not log out!"
  end
end

Given(/^that the admin user is logged\-in$/) do
  login(browser, your_admin_username, your_admin_password)
end

Given(/^an item can be added to the shopping cart$/) do
  browser.link(text: 'Add to Cart').click
end

Given(/^I click on the "([^"]*)" button$/) do |link|
  sleep 1
  browser.button(value: "FD2 PROD").click
end

Given(/^I see "([^"]*)" displayed on the PP$/) do |page_name|
  expect(browser.text).to include page_name
end

When(/^enter a Cardholder Name of up to thirty characters like "([^"]*)"$/) do |name|
  browser.text_field(id: 'exact_cardholder_name').set(name)
end

When(/^I do a purchase with my "([^"]*)" credit card$/) do |card|
  browser.text_field(id: 'x_card_num').set(card)
end

When(/^I enter a future "([^"]*)" in the mmyy format as the Expiry Date$/) do |date|
  browser.text_field(id: 'x_exp_date').set(date)
end

When(/^I enter a test Security Code like "([^"]*)"$/) do |code|
  browser.text_field(id: 'x_card_code').set(code)
end

When(/^I click on the payment button$/) do
  browser.button(value: "Pay With Your Credit Card").click
end

Then(/^I should see the "([^"]*)" on the receipt$/) do |notice|
  expect(browser.text).to include notice
end

Then(/^I should be able to leave the receipt view$/) do
  browser.button(value: 'Back to the Payment Page Demo Site').click
end

Then(/^I should be able to log out$/) do
  browser.link(text: 'Log Out').click
end

Then(/^I should see "([^"]*)" displayed on the page$/) do |notification|
  expect(browser.text).to include notification
end
