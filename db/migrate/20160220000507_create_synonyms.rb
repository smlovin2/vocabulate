class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.string :word
      t.belongs_to :word, index: true

      t.timestamps
    end
  end
end
