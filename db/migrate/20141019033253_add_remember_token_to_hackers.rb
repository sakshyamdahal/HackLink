class AddRememberTokenToHackers < ActiveRecord::Migration
  def change
  	add_column :hackers, :remember_token, :string
  	add_index :hackers, :remember_token
  	add_index :hackers, :username
  end
end
