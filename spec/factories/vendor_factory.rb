FactoryBot.define do
  factory :vendor do
    sequence(:name) { |n| "Test Vendor #{n}" }
    town "Storms Reach"
    sequence(:description) { |n| "This is a description of Test Vendor #{n}." }
  end
end
