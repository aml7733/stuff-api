# frozen_string_literal: true

# Box model acts as both container and item for nested boxes
class Box < ApplicationRecord
  validates :name, presence: true, uniqueness: true, allow_blank: false
  validates :box_type, presence: true, allow_blank: false
  validates :description, presence: true

  has_many :children, class_name: 'Box', foreign_key: 'parent_id', dependent: :destroy, inverse_of: :parent
  belongs_to :parent, class_name: 'Box', optional: true
end
