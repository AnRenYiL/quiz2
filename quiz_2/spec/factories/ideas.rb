FactoryBot.define do
  factory :idea do
    title { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
  end
end
