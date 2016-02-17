class CreateWordLists < ActiveRecord::Migration
  def change
    create_table :word_lists do |t|
      t.boolean :current_list
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
