require 'rails_helper'

describe "it shows user without admin process" do
  before do
    @user = User.create ({email: 'user@fakemail.com', password: 'useruser', password_confirmation: 'useruser', admin: false})
  end
  it 'shows user create a product' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link 'Create'
    expect(page).to have_content 'You do not have admin access.'
  end
end 