require 'rails_helper'

describe "it shows user without admin process" do
  before do
    @user = User.create ({email: 'user@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @product = Product.create({name: 'The Star', cost: '12.41', country_of_origin: 'Brazil', id: 1})
  end
  it 'shows user create a review' do
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
    expect(page).to have_content 'Hooray!!! Your review is added!'
    expect(page).to have_content 'Test Testing'
    expect(page).to have_content 'Just testing this test to make sure that this test is working.'
  end
  it 'shows user create a review with insufficient characters in content' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link @product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test.'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    expect(page).to have_content 'Dang this create method. Gotta do it again!'
    expect(page).to have_content 'Content body is too short (minimum is 50 characters)'
  end
end 