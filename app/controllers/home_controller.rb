class HomeController < ApplicationController
  def index
    if current_user.role 
      @products = current_user.products
    else
      @products = Product.all
    end
  end
end
