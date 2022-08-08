class OrderShip
  include ActiveModel::Model
  attr_accessor :post_code, :consignor_area_id, :shikuchoson, :banchi, :build_name, :phone_number, :item_id, :user_id,
                :order_id, :token

  validates :consignor_area_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :shikuchoson
    validates :banchi
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/}
    validates :item_id
    validates :user_id
    validates :token
  end
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Ship.create(post_code: post_code, consignor_area_id: consignor_area_id, shikuchoson: shikuchoson, banchi: banchi,
                build_name: build_name, phone_number: phone_number, order_id: order.id)
  end
end
