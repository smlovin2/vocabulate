FactoryGirl.define do
  factory :word do
    word "food"
    definition "Something you eat."
    association :user
  end
end