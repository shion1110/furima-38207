FactoryBot.define do
  factory :item do
    image { Faker::Lorem.sentence }
    association :user
    item_name { 'ご飯' }
    item_status_id { '2' }
    item_version { 'アイあいあい' }
    category_id { '2' }
    consignor_area_id { '2' }
    days_ship_id { '2' }
    delivary_charge_id { '2' }
    cost { 1000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    extend ActiveHash::Associations::ActiveRecordExtensions
  end
end
