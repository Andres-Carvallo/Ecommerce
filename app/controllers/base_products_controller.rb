class BaseProductsController < ApplicationController
  before_action :set_base_product, only: [:show, :edit, :update, :destroy]

  # GET /base_products
  # GET /base_products.json
  def index
    @base_products = BaseProduct.all
  end

  # GET /base_products/1
  # GET /base_products/1.json
  def show
  end

  # GET /base_products/new
  def new
    @base_product = BaseProduct.new
  end

  # GET /base_products/1/edit
  def edit
  end

  # POST /base_products
  # POST /base_products.json
  def create
    @base_product = BaseProduct.new(base_product_params)

    respond_to do |format|
      if @base_product.save
        format.html { redirect_to @base_product, notice: 'Base product was successfully created.' }
        format.json { render :show, status: :created, location: @base_product }
      else
        format.html { render :new }
        format.json { render json: @base_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /base_products/1
  # PATCH/PUT /base_products/1.json
  def update
    respond_to do |format|
      if @base_product.update(base_product_params)
        format.html { redirect_to @base_product, notice: 'Base product was successfully updated.' }
        format.json { render :show, status: :ok, location: @base_product }
      else
        format.html { render :edit }
        format.json { render json: @base_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /base_products/1
  # DELETE /base_products/1.json
  def destroy
    @base_product.destroy
    respond_to do |format|
      format.html { redirect_to base_products_url, notice: 'Base product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_base_product
      @base_product = BaseProduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def base_product_params
      params.require(:base_product).permit(:name)
    end
end
