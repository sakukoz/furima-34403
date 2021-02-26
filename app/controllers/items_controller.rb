class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @prototype = Item.find(params[:id])
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :image, :description, :category_id, :condition_id, :delivery_fee_id,
                                 :delivery_days_id, :region_id, :price).merge(user_id: current_user.id)
  end
end
