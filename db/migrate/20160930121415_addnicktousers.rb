class Addnicktousers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :nick, :string 
  end
end
