class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :interest
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
