FactoryBot.define do
  factory :item do
    item_name { Faker::Name.last_name }
    description      { Faker::Lorem.sentence }
    category_id      { Faker::Types.rb_integer }
    condition_id     { Faker::Types.rb_integer }
    delivery_fee_id  { Faker::Types.rb_integer }
    region_id        { Faker::Types.rb_integer }
    delivery_days_id { Faker::Types.rb_integer }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
