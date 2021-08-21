require 'rails_helper'

describe "it shows user without admin process" do
  before do
    @user = User.create ({email: 'user@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
    @product = Product.create({name: 'The Star', cost: '12.41', country_of_origin: 'Brazil', id: 1})
  end
  it 'shows user delete a product' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link @product.name
    click_link 'Delete product'
    expect(page).to have_content 'You do not have admin access.'
  end
end 