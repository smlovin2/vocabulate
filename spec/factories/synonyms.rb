FactoryGirl.define do
  factory :synonym do
    word 'stuff'
    association :word
  end
end
