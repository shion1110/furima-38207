class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @item = Item.find(params[:item_id])
    @order_ship = OrderShip.new
    redirect_to root_path unless @item.user == current_user || @item.order.blank?
    if current_user.id == @item.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = 'sk_test_884d0b6aae16e2fde6e345fb'
    Payjp::Charge.create(
      amount: @item.cost,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
