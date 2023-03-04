class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @shipping_cost = 800
    # @total = 0
    # @order_details = OrderDetail.all
    @order_detail = OrderDetail.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    # @order.update(order_params)
    @order_details = @order.order_details 
    if @order.update(order_params)
      @order_details.update(making_status: 1) if @order.status == "payment_confirmation"
        ## ①注文ステータスが「入金確認」とき、製作ステータスを全て「製作待ち」に更新する
    end
         redirect_to admin_order_path(@order.id)
  end
  private

  def order_params
    params.require(:order).permit(:status)
  end
end
