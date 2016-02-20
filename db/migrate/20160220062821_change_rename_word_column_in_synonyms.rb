class ChangeRenameWordColumnInSynonyms < ActiveRecord::Migration
  def change
    rename_column :synonyms, :word, :synonym
  end
end
