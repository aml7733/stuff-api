# frozen_string_literal: true

# Box is the main object class in Stuff, acts as conatiner and item
class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.string :name
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
