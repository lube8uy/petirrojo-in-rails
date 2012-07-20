class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.integer :twitter_id
      t.datetime :created_at
      t.string :from_user
      t.integer :from_user_id
      t.string :from_user_name
      t.string :iso_language_code
      t.string :profile_image_url
      t.text :source
      t.string :body
      t.string :to_user
      t.integer :to_user_id
      t.string :to_user_name
    end
  end
end
