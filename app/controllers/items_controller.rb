class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    # @items = Item.order(created_at: :DESC)
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

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_version, :category_id, :item_status_id, :delivary_charge_id,
                                 :consignor_area_id, :days_ship_id, :cost).merge(user_id: current_user.id)
  end
end
