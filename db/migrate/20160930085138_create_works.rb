class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :company
      t.string :details
      t.boolean :active
      t.date :start_date
      t.date :end_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
