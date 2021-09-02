class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name
      t.text :content
      t.date :deadline
      t.references :task , foreign_key: true

      t.timestamps
    end
  end
end
