class CreateSourcings < ActiveRecord::Migration[5.2]
  def change
    create_table :sourcings do |t|
      t.references :task, foreign_key:true
      t.references :source, foreign_key:true
      t.timestamps
    end
  end
end
