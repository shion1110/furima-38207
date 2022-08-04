FactoryBot.define do
  factory :order_ship do
    post_code { '110-1110' }
    consignor_area_id { 2 }
    shikuchoson { 'さささ' }
    banchi { 'あう1-1' }
    phone_number { '09099999999' }
    build_name { '多々た' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
