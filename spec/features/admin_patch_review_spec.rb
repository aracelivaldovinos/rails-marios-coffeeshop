require 'rails_helper'

describe "it shows admin process" do
  before do
    @user = User.create ({email: 'admin@fakemail.com', password: 'adminadmin', password_confirmation: 'adminadmin', admin: true})
    # @product = Product.create({name: 'The Star', cost: '12.41', country_of_origin: 'Brazil', id: 1})
    # @review = Review.create({author: 'Testing', content_body: 'This is a test that I am testing to see if it passes.', rating: '5', product_id: 1})
  end
  it 'shows admin edit a review' do
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
    expect(page).to have_content 'Hooray!!! Your review is added!'
    expect(page).to have_content 'Test'
    expect(page).to have_content 'This is a test that I am testing to see if it passes.'
  end
  it 'shows admin create a review without a rating' do
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
    fill_in 'Rating', :with => ''
    click_on 'Create Review'
    expect(page).to have_content 'Dang this create method. Gotta do it again!'
    expect(page).to have_content 'Rating is not a number'
    expect(page).to have_content 'Rating can\'t be blank'
    expect(page).to have_content 'Rating is not a number'
  end
end 