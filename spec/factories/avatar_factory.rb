FactoryBot.define do
  factory :avatar do
    sequence(:name) { |n| "Test Avatar #{n}" }
    town 'Storms Reach'
  end
end
