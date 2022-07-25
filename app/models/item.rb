class Item < ApplicationRecord
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_version, presence: true
  validates :category_id, presence: true,numericality: { other_than: 1 }
  validates :item_status_id, presence: true,numericality: { other_than: 1 }
  validates :delivary_charge_id, presence: true,numericality: { other_than: 1 }
  validates :consignor_area_id, presence: true,numericality: { other_than: 1 }
  validates :days_ship_id, presence: true,numericality: { other_than: 1 }
  validates :cost, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :consignor_area
  belongs_to :days_ship
  belongs_to :delivary_charge
  belongs_to :item_status

end
