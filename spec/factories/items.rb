FactoryBot.define do
  factory :item do
    text           {Faker::Lorem.sentence}
    name           {'item'}
    price          {'500'}
    category_id    {'2'}
    status_id      {'2'}
    charge_id      {'2'}
    prefecture_id  {'2'}
    day_id         {'2'}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
