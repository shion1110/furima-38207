class CreateShips < ActiveRecord::Migration[6.0]
  def change
    create_table :ships do |t|
      t.string     :post_code,        null: false
      t.integer       :consignor_area_id,    null: false
      t.string    :shikuchoson,     null: false
      t.string   :banchi, null: false
      t.string    :build_name
      t.string    :phone_number,  null: false
      t.references    :order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end

