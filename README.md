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
| birth_year         | string | null: false              |
| birth_month        | string | null: false              |
| birth_day          | string | null: false              |
### Association

- has_many :items
- has_many :ordars

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_image         | string | null: false |
| item_version       | string | null: false |
| category           | string | null: false |
| item_status        | string | null: false |
| delivary_charge    | string | null: false |
| consignor_area     | string | null: false |
| days_ship          | string | null: false |


### Association


- has_one :ordars
- belongs_to :user


## ordars テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| card_number        | string | null: false |
| effective_month    | string | null: false |
| effective_year     | string | null: false |
| security_code      | string | null: false |


### Association

- belongs_to :ship
- belongs_to :user
- belongs_to :item

## ships テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefectures        | string | null: false |
| shikuchoson        | string | null: false |
| banchi             | string | null: false |
| build_name         | string |             |
| phone_number       | string | null: false |

### Association

- belongs_to :ordar
