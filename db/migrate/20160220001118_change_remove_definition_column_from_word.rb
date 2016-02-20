class ChangeRemoveDefinitionColumnFromWord < ActiveRecord::Migration
  def change
    remove_column :words, :definition, :string
  end
end
