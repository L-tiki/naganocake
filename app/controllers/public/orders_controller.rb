class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @order.shipping_cost = 800
    @total_price = (@cart_items.map { |cart_item| cart_item.item.add_tax_price * cart_item.amount }.sum ).floor

    #『ご自身の住所』を選択した場合
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name

    #『登録済住所から選択』を選択した場合
    elsif params[:order][:address_number] == "2"
			@address = Address.find_by(address: @order.address)
			@order.postal_code = @address.postal_code
			@order.address = @address.address
			@order.name = @address.name

		#『新しいお届け先』を選択した場合
		elsif params[:order][:address_number] == "3"
		  @address = Address.new

    else
      render :new
    end
  end

  def index
  end

  def create

  end

  def show
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :payment_method)
end
end
