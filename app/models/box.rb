# frozen_string_literal: true

# Box model acts as both container and item for nested boxes
class Box < ApplicationRecord
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :box_type, presence: true, allow_blank: true
  validates :description, presence: true
end
