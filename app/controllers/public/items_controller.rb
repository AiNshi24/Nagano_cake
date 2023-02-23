class Public::ItemsController < ApplicationController
  def index
    # @items = Item.order('id DESC').limit(8)
    # @item = Item.page(params[:page])
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_items = @item.cart_items
  end
end
