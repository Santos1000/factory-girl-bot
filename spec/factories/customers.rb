FactoryBot.define do
  # aliases == apelido
  factory :customer, aliases: [:user] do
    name { Faker::Name.name }
    address { Faker::Address.street_address }
    # email { Faker::Internet.email }

    sequence(:email) { |n| "meu_email_#{n}@email.com" }

    trait :male do
      gender 'M'
    end

    trait :female do
      gender 'F'
    end

    trait :vip do
      vip true
      days_to_pay 30
    end

    trait :default do
      vip false
      days_to_pay 15
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.qtt_order, customer: customer)
      end
    end

    factory :customer_male, traits: [:male]
    factory :customer_female, traits: [:female]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_male_vip, traits: [:male, :vip]
    factory :customer_female_vip, traits: [:female, :vip]
    factory :customer_male_default, traits: [:male, :default]
    factory :customer_female_default, traits: [:female, :default]

    transient do
      upcased false # the transient is for seting the obj factorie not the test
      qtt_order 3 #create 3 orders test
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end