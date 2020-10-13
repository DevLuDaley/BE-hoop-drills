# frozen_string_literal: true

class Drill < ApplicationRecord
  has_and_belongs_to_many :routines
end
