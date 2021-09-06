class AddUserRefToSources < ActiveRecord::Migration[5.2]
  def change
    add_reference :sources, :user, foreign_key: true
  end
end
