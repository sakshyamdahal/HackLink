class AddFieldsToHackers < ActiveRecord::Migration
  def change
  	add_column :hackers, :name, :string
  	add_column :hackers, :email, :string
  	add_column :hackers, :username, :string
  	add_column :hackers, :contact, :string
  	add_column :hackers, :gender, :string
  end
end
