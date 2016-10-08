class CreateSocialInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :social_infos do |t|
      t.string :website
      t.string :fb
      t.string :linkedin
      t.string :twitter
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
