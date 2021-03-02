FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    region_id { 3 }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone { 12345678901 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
