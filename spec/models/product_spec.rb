require 'rails_helper'

describe Product do 
  it {should have_many(:reviews)} 
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  it ("titleizes the name of a product") do
  product = Product.create({name: "jellybean calender", cost: 5.25, country_of_origin: "USA"})
  end 
end 