FactoryGirl.define do
  factory :word_list do
    association :user
    association :word
  end
end
