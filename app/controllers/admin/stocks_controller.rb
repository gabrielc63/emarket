class Admin::StocksController < AdminController
  before_action :set_stock, only: %i[show edit update destroy]

  # GET /stocks or /stocks.json
  def index
    @admin_stocks = Stock.where(product_id: params[:product_id])
  end

  # GET /stocks/1 or /stocks/1.json
  def show; end

  # GET /stocks/new
  def new
    @product = Product.find(params[:product_id])
    @stock = Stock.new
  end

  # GET /stocks/1/edit
  def edit
    @product = Product.find(params[:product_id])
    @stock = Stock.find(params[:id])
  end

  # POST /stocks or /stocks.json
  def create
    @product = Product.where(id: params[:product_id]).first
    @stock = @product.stocks.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to admin_product_stock_url(@product, @stock), notice: 'Stock was successfully created.' }
        format.json { render :show, status: :created, location: @stock }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stocks/1 or /stocks/1.json
  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html do
          redirect_to admin_product_stock_url(@stock.product, @stock), notice: 'Stock was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stocks/1 or /stocks/1.json
  def destroy
    @stock.destroy!

    respond_to do |format|
      format.html { redirect_to admin_product_stocks_url, notice: 'Stock was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = Stock.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stock_params
    params.require(:stock).permit(:product_id, :amount, :size)
  end
end
