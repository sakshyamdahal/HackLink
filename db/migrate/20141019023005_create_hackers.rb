class CreateHackers < ActiveRecord::Migration
  def change
    create_table :hackers do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :contactnumber
      t.string :gender
      
      t.timestamps
    end
  end
end
