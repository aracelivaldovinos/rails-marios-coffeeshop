require 'rails_helper'

describe "it shows admin process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
  end
  it 'shows admin create a product' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link 'Create'
    fill_in 'Name', :with => 'Lovely Dove'
    fill_in 'Cost', :with => 12.51
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Success! Product was added. ☺'
    expect(page).to have_content 'Lovely Dove'
    expect(page).to have_content '12.51'
    expect(page).to have_content 'United States'
  end
  it 'shows admin create a product without name' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link 'Create'
    fill_in 'Name', :with => ''
    fill_in 'Cost', :with => 12.51
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    expect(page).to have_content 'Oh no! ☹ Try creating it again.'
    expect(page).to have_content 'Name can\'t be blank'
  end
end 
