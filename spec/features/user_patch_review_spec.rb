require 'rails_helper'

describe "it shows user without admin process" do
  before do
    @user = User.create ({email: 'user@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @user1 = User.create ({email: 'user1@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @product = Product.create({name: 'The Star', cost: '12.41', country_of_origin: 'Brazil', id: '1'})

  end
  it 'shows user edit their own review' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link @product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    click_link 'Test Testing'
    click_link 'Edit review'
    fill_in 'Rating', :with => '5'
    click_on 'Update Review'
    expect(page).to have_content 'YES!!! The review has been updated!'
    expect(page).to have_content 'Test Testing'
    expect(page).to have_content 'Just testing this test to make sure that this test is working.'
    expect(page).to have_content '5'
  end
  it 'shows user edit their own review but with insufficient character in content body' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link @product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    click_link 'Test Testing'
    click_link 'Edit review'
    fill_in 'Content body', :with => 'This is just a test.'
    click_on 'Update Review'
    expect(page).to have_content 'Okay...Try it one more time'
  end
    it 'shows user edit other reviews' do
      visit '/'
      click_link 'Login'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
      click_link @product.name
      click_link 'Add a review'
      fill_in 'Author', :with => 'Test Testing'
      fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
      fill_in 'Rating', :with => '4'
      click_on 'Create Review'
      click_link 'Logout'
      visit '/'
      click_link 'Login'
      fill_in 'Email', with: @user1.email
      fill_in 'Password', with: @user1.password
      click_on 'Log in'
      click_link @product.name
      click_link 'Test Testing'
      click_link 'Edit review'
    expect(page).to have_content 'You do not have access to this content.'
  end
end 