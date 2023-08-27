# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :code, limit: 6
      t.datetime :start
      t.time :duration
      t.bigint :departure_airport_id, null: false
      t.bigint :arrival_airport_id, null: false

      t.timestamps
    end
    add_index :flights, :code

    add_foreign_key :flights, :airports, column: :departure_airport_id
    add_foreign_key :flights, :airports, column: :arrival_airport_id
  end
end
