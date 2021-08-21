require 'rails_helper'

describe "it show user sign up and log in process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
  end
  it 'signs up a user' do
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'spectest@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content('spectest@email.com')
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  it 'logs in a register user' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    expect(page).to have_content(@user.email)
    expect(page).to have_content('Signed in successfully.')
  end

  it 'log out a register user' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end 