class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :current_city
      t.string :hometown
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
