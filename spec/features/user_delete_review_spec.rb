require 'rails_helper'

describe "it shows user without admin process" do
  before do
    @user = User.create ({email: 'user@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @user1 = User.create ({email: 'user1@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @product = Product.create({name: 'The Star', cost: '12.41', country_of_origin: 'Brazil', id: '1'})

  end
  it 'shows user delete their own review' do
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
    click_on 'Delete Review'
    expect(page).to have_no_content 'Test Testing'
    expect(page).to have_no_content 'Just testing this test to make sure that this test is working.'
  end
    it 'shows user delete other reviews' do
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
      click_link 'Delete Review'
    expect(page).to have_content 'You do not have access to this content.'
  end
end 