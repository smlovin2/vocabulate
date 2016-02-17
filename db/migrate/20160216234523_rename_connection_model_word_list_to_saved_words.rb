class RenameConnectionModelWordListToSavedWords < ActiveRecord::Migration
  def change
    rename_table :word_lists, :saved_words
  end
end
