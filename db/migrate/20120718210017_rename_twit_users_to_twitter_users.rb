class RenameTwitUsersToTwitterUsers < ActiveRecord::Migration
  def up
  	rename_table :twit_users, :twitter_users
  end

  def down
  end
end
