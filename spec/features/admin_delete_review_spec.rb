require 'rails_helper'

describe "it shows admin process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
  end
  it 'shows admin delete a review' do
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
    click_link 'Lovely Dove'
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test'
    fill_in 'Content body', :with => 'This is a test that I am testing to see if it passes.'
    fill_in 'Rating', :with => '5'
    click_on 'Create Review'
    click_link 'Test'
    click_on 'Delete Review'
    expect(page).to have_no_content 'Test'
    expect(page).to have_no_content 'This is a test that I am testing to see if it passes.'
  end
end 