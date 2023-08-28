class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.references :booking, null: false, foreign_key: true
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
