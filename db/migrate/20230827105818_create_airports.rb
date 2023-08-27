# frozen_string_literal: true

class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :code, limit: 3
      t.string :place

      t.timestamps
    end
    add_index :airports, :code
  end
end
