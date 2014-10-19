class AddPasswordDigestToHackers < ActiveRecord::Migration
  def change
  	add_column :hackers, :password_digest, :string
  end
end
