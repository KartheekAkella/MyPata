class CreateHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :hashtags do |t|
      t.string :tag1
      t.string :tag2
      t.string :tag3
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
