class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  def index
    @order_ship = OrderShip.new
  if  @item.user == current_user
    redirect_to root_path
  end

  if @item.order.blank?

    redirect_to root_path
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_ship).permit(:post_code, :consignor_area_id, :shikuchoson, :banchi, :build_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.cost,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
