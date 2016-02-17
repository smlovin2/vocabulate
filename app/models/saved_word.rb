class SavedWord < ActiveRecord::Base
  belongs_to :word_list
  belongs_to :word
end
