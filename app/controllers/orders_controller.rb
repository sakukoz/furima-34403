class OrdersController < ApplicationController
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id]) 

  end

  def create
    @order_address = OrderAddress.new(order_params)
  end

  private
  def order_params
    params.require(:order_address).permit(:city, :order, :postcode, :region_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item: params[:item_id])
  end
 
end
