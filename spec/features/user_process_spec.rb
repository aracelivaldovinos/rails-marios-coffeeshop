require 'rails_helper'

describe "it shows user without admin process" do
  it 'signs up a user' do
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link 'Create new product'
    expect(page).to have_content 'You do not have admin access.'
  end
  it 'prevents user from editing a product' do
    product = Product.create(name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link product.name
    click_link 'Edit'
    expect(page).to have_content 'You do not have admin access.'
  end
  it 'prevents user from deleting a product' do
    product = Product.create(name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link product.name
    click_link 'Delete product'
    expect(page).to have_content 'You do not have admin access.'
  end
  it 'it shows user adding a review' do
    product = Product.create(name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    expect(page).to have_content 'Hooray!!! Your review is added!'
    expect(page).to have_content 'Test Testing'
    expect(page).to have_content 'Just testing this test to make sure that this test is working.'
    expect(page).to have_content '4'
  end
  it 'it shows user editing a review' do
    product = Product.create(name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
    fill_in 'Rating', :with => '4'
    click_on 'Create Review'
    click_link 'Test Testing'
    click_link 'Edit review'
    fill_in 'Rating', :with => '5'
    click_on 'Update Review'
    expect(page).to have_content 'YES!!! The review has been updated!'
    expect(page).to have_content 'Test Testing'
    expect(page).to have_content 'Just testing this test to make sure that this test is working.'
    expect(page).to have_content '5'
  end

  # it 'it shows user editing a review' do
  #   product = Product.create(id: 1, name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
  #   review = Review.create(author: 'Testing', content_body: 'this coffee taste really good the smell is good too', rating: '5', product_id: 1)
  
  #   visit '/'
  #   click_link 'Register'
  #   fill_in 'Email', with: 'fake@test.com'
  #   fill_in 'Password', with: '123456'
  #   fill_in 'Password confirmation', with: '123456'
  #   click_on 'Sign up'
  #   click_link product.name
  #   click_link review.author
  #   click_link 'Edit review'
  #   expect(page).to have_content 'You do not have access to this content.'
  # end

  it 'it shows user deletes a review' do
    product = Product.create(name: 'The Star', cost: '12.41', country_of_origin: 'Brazil')
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'fake@test.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'
    click_link product.name
    click_link 'Add a review'
    fill_in 'Author', :with => 'Test Testing'
    fill_in 'Content body', :with => 'Just testing this test to make sure that this test is working.'
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    click_link 'Test Testing'
    click_link 'Delete review'
    expect(page).to have_no_content 'Test Testing'
    expect(page).to have_no_content 'Just testing this test to make sure that this test is working.'
  end
end 