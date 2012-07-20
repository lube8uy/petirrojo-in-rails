class Twit < ActiveRecord::Base
  attr_accessible :body, :created_at, :from_user, :from_user_id, :from_user_name, :iso_language_code, :profile_image_url, :source, :to_user, :to_user_id, :to_user_name, :twitter_id
end
