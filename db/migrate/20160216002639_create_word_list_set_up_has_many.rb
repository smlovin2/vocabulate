class CreateWordListSetUpHasMany < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.belongs_to :user, index: true
      t.belongs_to :word, index: true
      t.boolean :current_list
      t.timestamps null: false
    end

    remove_column :words, :user_id
  end
end
