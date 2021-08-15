class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action except: [:index, :show] do
    unless current_user.admin == true
      flash[:alert] = 'You do not have admin access.'
        redirect_to products_path 
    end
  end 
  


  def index
    @products = Product.order(params[:created_at]).limit(30)
    # @products = Product.all
    render :index 
  end 

  def new
    @user = current_user
    @product = Product.new
    render :new
  end 

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Success! Product was added. ☺"
      redirect_to products_path
    else
      flash[:alert] = "Oh no! ☹ Try creating it again."
      render :new
    end
  end 

  def edit
    @product = Product.find(params[:id])
    render :edit
  end 

  def show
    @product = Product.find(params[:id])
  end 

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Yay! It is saved!"
      redirect_to product_path
    else
      flash[:alert] = "Gosh darnit! Gotta do it again."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end 

  private 
  def product_params
    params.require(:product).permit(:name, :cost, :country_of_origin)
  end 
end 