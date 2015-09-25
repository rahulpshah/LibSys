class BookTransactionsController < ApplicationController
  before_action :set_book_transaction, only: [:show, :edit, :update, :destroy]

  # GET /book_transactions
  # GET /book_transactions.json
  def index
    @book_transactions = BookTransaction.all
  end

  # GET /book_transactions/1
  # GET /book_transactions/1.json
  def show
  end

  # GET /book_transactions/new
  def new
    @book_transaction = BookTransaction.new
  end

  # GET /book_transactions/1/edit
  def edit
  end

  # POST /book_transactions
  # POST /book_transactions.json
  def create
    @book_transaction = BookTransaction.new(book_transaction_params)

    respond_to do |format|
      if @book_transaction.save
        format.html { redirect_to @book_transaction, notice: 'Book transaction was successfully created.' }
        format.json { render :show, status: :created, location: @book_transaction }
      else
        format.html { render :new }
        format.json { render json: @book_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_transactions/1
  # PATCH/PUT /book_transactions/1.json
  def update
    respond_to do |format|
      if @book_transaction.update(book_transaction_params)
        format.html { redirect_to @book_transaction, notice: 'Book transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_transaction }
      else
        format.html { render :edit }
        format.json { render json: @book_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_transactions/1
  # DELETE /book_transactions/1.json
  def destroy
    @book_transaction.destroy
    respond_to do |format|
      format.html { redirect_to book_transactions_url, notice: 'Book transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_transaction
      @book_transaction = BookTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_transaction_params
      params.require(:book_transaction).permit(:isbn, :name, :member)
    end
end
