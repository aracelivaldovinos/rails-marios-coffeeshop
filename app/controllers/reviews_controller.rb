class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new  
    render :new 
  end 

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
  
    if @review.save
      flash[:notice] = "Hooray!!! Your review is added!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Dang this create method. Gotta do it again!"
      render :new
    end 
  end 

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end 

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end 

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "YES!!! The review has been updated!"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[params[:product_id]])
      flash[:alert] = "Okay...Try it one more time." 
      render :edit
    end
  end 

  def destroy
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@review.product)
  end 

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end 
end 