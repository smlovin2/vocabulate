FactoryGirl.define do
  factory :definition do
    text 'This is definition'
    association :word
  end
end
