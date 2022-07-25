class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_version, presence: true
  validates :category_id, presence: true
  validates :item_status, presence: true
  validates :delivary_charge_id, presence: true
  validates :consignor_area, presence: true
  validates :day_ship_id, presence: true
  validates :cost, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :consignor_area
  belongs_to :days_ship
  belongs_to :delivary_charge
  belongs_to :item_status
  validates :Item_id, numericality: { other_than: 1 } 
end
