class CreateDefinitions < ActiveRecord::Migration
  def change
    create_table :definitions do |t|
      t.string :text
      t.string :part_of_speech
      t.belongs_to :word, index: true

      t.timestamps
    end
  end
end
