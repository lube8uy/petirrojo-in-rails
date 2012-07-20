class CreateTwitUsers < ActiveRecord::Migration
  def change
    create_table :twit_users do |t|
      t.integer :twitter_id
      t.integer :friends_count
      t.string :profile_image_url
      t.string :location
      t.text :description
      t.string :lang

      t.timestamps
    end
  end
end
