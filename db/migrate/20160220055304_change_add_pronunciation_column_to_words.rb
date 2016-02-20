class ChangeAddPronunciationColumnToWords < ActiveRecord::Migration
  def change
    add_column :words, :pronunciation, :string
  end
end
