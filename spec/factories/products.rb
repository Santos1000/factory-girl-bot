FactoryBot.define do
  factory :product do
    description faker::Commerce.product_name
    price Faker::Commerce.price
    category 
  end
end
