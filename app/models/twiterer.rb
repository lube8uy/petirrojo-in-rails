class Twiterer < ActiveRecord::Base
  attr_accessible :name, :created_at, :description, :friends_count, :lang, :location, :profile_image_url, :twitter_id

  def Twiterer.find_by_id(id)
  	client = TwitterApi.new
  	request = client.get_user_information_by_id(id)
  	return Trend.json_twiterer_to_object(request.response[0])
  end

  private

  def Trend.json_twiterer_to_object(user)
    Twiterer.new(
      :name => user['name'], 
      :description => user['description'], 
      :created_at => user['created_at'], 
      :friends_count => user['friends_count'], 
      :lang => user['lang'],
      :location => user['location'],
      :profile_image_url => user['profile_image_url'], 
      :twitter_id => user['twitter_id']
    )
  end
end
