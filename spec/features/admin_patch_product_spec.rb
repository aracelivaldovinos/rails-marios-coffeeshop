require 'rails_helper'

describe "it shows admin process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
  end
  it 'shows admin edit product' do
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
    click_link 'Edit'
    fill_in 'Name', :with => 'Dove'
    fill_in 'Cost', :with => 12.51
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Update Product'
    expect(page).to have_content 'Yay! It is saved!'
    expect(page).to have_content 'Dove'
    expect(page).to have_content '12.51'
    expect(page).to have_content 'United States'
  end
  it 'shows admin edit product without cost' do
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
    click_link 'Edit'
    fill_in 'Name', :with => 'Dove'
    fill_in 'Cost', :with => ''
    fill_in 'Country of origin', :with => 'United States'
    click_on 'Update Product'
    expect(page).to have_content 'Gosh darnit! Gotta do it again.'
  end
end 