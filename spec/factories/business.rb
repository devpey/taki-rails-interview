FactoryBot.define do
    factory :business do
        name { FFaker::Lorem.word}
        address { FFaker::Lorem.word}
        city { FFaker::Lorem.word}
        user_id {FFaker::Random.rand(1..3)}
    end
end
