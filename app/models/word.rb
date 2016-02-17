class Word < ActiveRecord::Base
  has_many :saved_words
  has_many :users, through: :saved_words
  has_many :defintions
end
