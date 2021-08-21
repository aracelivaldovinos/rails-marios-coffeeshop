require 'rails_helper'

describe "it shows admin process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
  end
  it 'shows admin delete product' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Log in'
    click_link 'Create new product'
    fill_in 'Name', :with => 'Lovely Dove'
    fill_in 'Cost', :with => 12.51
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Create Product'
    click_link 'Lovely Dove'
    click_link 'Delete product'
    expect(page).to have_no_content 'Lovely Dove'
    expect(page).to have_no_content '12.51'
    expect(page).to have_no_content 'United States'
  end
end 