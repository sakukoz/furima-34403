class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :set_item


  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end 
  end

  private
  def set_item
    @item = Item.find(params[:item_id]) 
  end

  def order_params
    params.require(:order_address).permit(:city, :order, :postcode, :region_id, :city, :street, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token], 
      currency: 'jpy' 
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id]) 
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
