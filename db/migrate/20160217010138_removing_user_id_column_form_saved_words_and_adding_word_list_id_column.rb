class RemovingUserIdColumnFormSavedWordsAndAddingWordListIdColumn < ActiveRecord::Migration
  def change
    remove_column :saved_words, :user_id, :integer
    add_column :saved_words, :word_list_id, :integer
    add_index :saved_words, :word_list_id
  end
end
