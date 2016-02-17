class WordList < ActiveRecord::Base
  belongs_to :user
  has_many :saved_words
  has_many :words, through: :saved_words
end
