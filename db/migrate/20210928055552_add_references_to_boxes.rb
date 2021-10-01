# frozen_string_literal: true

# Add referenes for self join
class AddReferencesToBoxes < ActiveRecord::Migration[6.1]
  def change
    add_reference :boxes, :parent, foreign_key: { to_table: :boxes }
  end
end
