# frozen_string_literal: true

class DrillSerializer < ActiveModel::Serializer
  attributes :id, :drill_name, :drill_type, :sets, :reps
end
