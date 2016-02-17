class ChangeRemoveCurrentListColumnFromSavedWords < ActiveRecord::Migration
  def change
    remove_column :saved_words, :current_list
  end
end
