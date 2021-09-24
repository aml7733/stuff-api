# frozen_string_literal: true

# Add index to boxes for quicker requests
class AddIndexToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_index :boxes, :name, unique: true
  end
end
