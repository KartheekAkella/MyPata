class CreateContactInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_infos do |t|
      t.text :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
