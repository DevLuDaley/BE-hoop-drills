# frozen_string_literal: true

class RoutineSerializer < ActiveModel::Serializer
  attributes :id, :routine_name
  has_many :drills
end
