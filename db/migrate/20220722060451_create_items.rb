class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name,        null: false
      t.text       :item_version,    null: false
      t.integer    :category_id,     null: false
      t.integer    :item_status_id, null: false
      t.integer    :delivary_charge_id,  null: false
      t.integer    :consignor_area_id,    null: false
      t.integer    :days_ship_id,    null: false
      t.integer    :delivary_charge, null:false
      t.integer    :cost,   null: false
      t.references :user,   null: false, foreign_key: true 
      t.timestamps
    end
  end
end
