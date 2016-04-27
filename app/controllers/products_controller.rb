class ProductsController < ApplicationController

  before_action :authenticate_user!
  def index
    @products = Product.all
    respond_to do |format|
      format.html
      format.json { render json: ProductDatatable.new(view_context) }
      format.pdf do
        pdf = ReportPdf.new(@products)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def show
    @product = Product.find params[:id]
    @products = Product.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@products)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    if @product.update product_params
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit :name, :description, :price,
      :use_type, :photo
  end
end
