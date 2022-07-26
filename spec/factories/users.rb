FactoryBot.define do
  factory :user do
    nickname { '田中' }
    email                 { Faker::Internet.free_email }
    password              {'abc1234'}
    password_confirmation { password }
    family_kanji { '山田' }
    first_kanji { '太郎' }
    family_kana { 'ヤマダ' }
    first_kana { 'タロウ' }
    birth_day  { '1980-01-01' } 
    
    extend ActiveHash::Associations::ActiveRecordExtensions
  end
end
