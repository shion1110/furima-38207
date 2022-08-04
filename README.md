# テーブル設計

## users テーブル 

| Column             | Type   | Options                  |
| ------------------ | ------ | ----------------------   |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| family_kanji       | string | null: false              |
| first_kanji        | string | null: false              |
| family_kana        | string | null: false              |
| first_kana         | string | null: false              |
| birth_day          | data   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| item_version       | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| delivary_charge_id | integer    | null: false                    |
| consignor_area_id  | integer    | null: false                    |
| days_ship_id       | integer    | null: false                    |
| cost               | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
### Association


- has_one :order
- belongs_to :user


## orders テーブル
| item     | references | null: false, foreign_key: true       |
| user     | references | null: false, foreign_key: true       |



### Association

- has_one    :ship
- belongs_to :user
- belongs_to :item

## ships テーブル

| Column             | Type       | Options                             |
| ------------------ | ---------- | ----------------------------------- |
| post_code          | string     | null: false                         |
| consignor_area_id  | integer    | null: false                         |
| shikuchoson        | string     | null: false                         |
| banchi             | string     | null: false                         |
| build_name         | string     |                                     |
| phone_number       | string     | null: false                         |
| order              | references | null: false, foreign_key: true      |
### Association

- belongs_to :order
