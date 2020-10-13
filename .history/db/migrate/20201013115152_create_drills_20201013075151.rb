class CreateDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :drills do |t|
      t.string, :drill_type
      t.string, :drill_name
      t.integer, :reps
      t.integer :sets

      t.timestamps
    end
  end
end
