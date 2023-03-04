class Admin::OrderDetailsController < ApplicationController
  def update
    @order = Order.find(params[:order_id])
    @order_detail = OrderDetail.find(params[:id])
    # @order_detail = @order.order_detail
    # @order_details = @order.order_detail.all
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
