FactoryGirl.define do
  factory :word_list do
    current_list true
    association :user
  end
end
