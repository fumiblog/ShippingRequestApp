class AddColumnConstructions5 < ActiveRecord::Migration[6.1]
  def change
    add_column :constructions, :complete, :boolean
  end
end
