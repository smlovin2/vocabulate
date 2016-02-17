FactoryGirl.define do
  factory :saved_word do
    association :user
    association :word
  end
end
