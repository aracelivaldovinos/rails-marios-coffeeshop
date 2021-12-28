
class DashboardController < ApplicationController
  def index
    @recent_products= Product.three_most_recent
    @us_location = Product.us_location  
    @most_reviews = Product.most_reviews
    @top_review = Review.top_review
  end
end