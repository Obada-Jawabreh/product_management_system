class ProductsController < ApplicationController
  before_action :authenticate_user!  
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy] 

  def index
    if current_user.role 
      @products = current_user.products
    else
      @products = Product.all 
    end
  end

  def show
  end

  def new
    @product = current_user.products.build 
  end

  def edit
  end

  def create
    @product = current_user.products.build(product_params) 

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    if current_user.role == true
      @product = Product.find(params[:id])
    else

      @product = Product.find_by(id: params[:id])
      if @product.nil?
        redirect_to products_path, alert: "Product not found or you don't have permission to view it."
      end
    end
  end

  def authorize_user!
    unless @product.user == current_user
      redirect_to products_path, alert: "You are not authorized to perform this action."
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :currency, :stock_quantity, images: [])
  end
end
