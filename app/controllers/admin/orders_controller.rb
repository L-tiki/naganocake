class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "payment_confirm"
      @order.order_details.update(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
      params.require(:order).permit(:status)
  end

end