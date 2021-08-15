class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    products_path
  end

  helper_method [:is_admin?, :is_user?]

  def is_admin?
    current_user && current_user.admin
  end

  def is_user?
    Review.find(params[:id]).user == current_user
  end

end
