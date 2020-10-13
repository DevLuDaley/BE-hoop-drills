# frozen_string_literal: true

class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :routines, :drills
  end
end
