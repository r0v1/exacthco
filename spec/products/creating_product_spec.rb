require 'rails_helper.rb'

feature 'Creating product' do

  # background do

  # end


  scenario 'can create a product' do

    visit '/'
    expect(page).to have_content('Shop')
    expect(page).to have_content('Cart')
    expect(page).to have_content('Transactions')
    expect(page).to have_selector(:link_or_button, 'Log In')
    click_link 'Log In'
    fill_in 'user_username', with: Rails.application.secrets.admin_user
    fill_in 'user_password', with: Rails.application.secrets.admin_password
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Forgot your password?')
    click_button 'Log in'
    # expect(page).to have_content('Logged in as #{Rails.application.secrets.admin_user}')
    expect(page).to have_content('Logged in as')
    # expect(page).to have_content('Log Out')
    expect(page).to have_selector(:link_or_button, 'Log Out', visible: true)
    expect(page).to have_selector(:link_or_button, 'Add a new Product')

    click_link 'Add a new Product'
    fill_in 'product_title', with: 'Test Product 1'
    fill_in 'product_description', with: 'Test Description 1'
    fill_in 'product_image_url', with: 'sun-glasses.png'
    fill_in 'product_price', with: '100'
    fill_in 'product_category', with: 'Vision health'
    fill_in 'product_subcategory', with: 'Glasses'
    click_button 'Create Product'
    expect(page).to have_content('Test Product 1')
    expect(page).to have_content('Test Description 1')
    expect(page).to have_content('100')
  end
end
