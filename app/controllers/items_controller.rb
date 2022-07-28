class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  def index
    
    @items = Item.order(created_at: :DESC)
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
  end

  def edit 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  def destroy  
    if current_user.id == @item.user_id
       @item.destroy
      redirect_to root_path 
    else
      render :show
    end
  end 
  



  private

  def item_params
    params.require(:item).permit(:image, :item_name, :item_version, :category_id, :item_status_id, :delivary_charge_id,
                                 :consignor_area_id, :days_ship_id, :cost).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end
end
