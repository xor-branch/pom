class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name, precence:true, null:false, uniqueness:true, length:{maximum:60}
      t.text :description, precence:true, null:false
      t.date :start, precence:true, null:false
      t.date :deadline, precence:true, null:false

      t.timestamps
    end
  end
end
