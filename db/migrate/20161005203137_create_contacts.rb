class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :contact_nick
      t.string :label
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
