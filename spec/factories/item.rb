FactoryBot.define do
    factory :item do
        name { FFaker::Lorem.word}
        price{FFaker::Random.rand(100..1200)}
        business_id = 1
    end
end
