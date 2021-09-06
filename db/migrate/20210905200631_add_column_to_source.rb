class AddColumnToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :title, :string
  end
end
