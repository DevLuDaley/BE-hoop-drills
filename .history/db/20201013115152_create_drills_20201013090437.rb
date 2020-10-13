# frozen_string_literal: true

class CreateRoutinesDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :routines_drills do |t|
      t.references :routine, null: false, foreign_key: true
      t.references :drill, null: false, foreign_key: true
    end
  end
end
