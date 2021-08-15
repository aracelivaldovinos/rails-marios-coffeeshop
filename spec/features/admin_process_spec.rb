# require 'rails_helper'

# describe "it shows user without admin process" do
#   it 'signs up a user' do
#     @user = User.create(email: 'fake@test.com', encrypted_password: '123456')
#     @user.admin = true
#     @user.save
#     visit '/'
#     click_link 'Register'
#     fill_in 'Email', with: @user.email
#     fill_in 'Password', with: @user.encrypted_password
#     fill_in 'Password confirmation', with: @user.encrypted_password
#     click_on 'Sign up'
#     click_link 'Create new product'
#     fill_in 'Name', :with => 'Lovely Dove'
#     fill_in 'Cost', :with => 12.51
#     fill_in 'Country of origin', :with => 'United States'
#     click_on 'Create Product'
#     expect(page).to have_content 'Success! Product was added. ☺'
#     expect(page).to have_content 'Lovely Dove'
#     expect(page).to have_content '12.51'
#     expect(page).to have_content 'United States'
#   end

# end 