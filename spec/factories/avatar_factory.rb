FactoryBot.define do
  factory :avatar do
    sequence(:name) { |n| "Test Avatar #{n}" }
    town "Storms Reach"

    factory :avatar_with_vendor do

      transient do
        vendors_count 1
      end

      after :build do |avatar, evaluator|
        build_list(:vendor, evaluator.vendors_count, avatar: avatar)
      end

      after :create do |avatar, evaluator|
        create_list(:vendor, evaluator.vendors_count, avatar: avatar)
      end

    end
  end
end
