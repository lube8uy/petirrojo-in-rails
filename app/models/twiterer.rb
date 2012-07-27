class Twiterer < ActiveRecord::Base
  attr_accessible :name, :created_at, :description, :friends_count, :lang, :location, :profile_image_url, :twitter_id

  def Twiterer.find_by_id(id)
    if id[/[A-Za-z]+/].nil?
    	client = TwitterApi.new
    	request = client.get_user_information_by_id(id)
    	Twiterer.json_twiterer_to_object(request.response[0])
    else
      Twiterer.find_by_username(id)
    end 
  end

  def Twiterer.find_by_username(username)
    client = TwitterApi.new
    request = client.get_user_information_by_username(username)
    Twiterer.json_twiterer_to_object(request.response[0])
  end

  private

  def Twiterer.json_twiterer_to_object(user)
    Twiterer.new(
      :name => user['name'], 
      :description => user['description'], 
      :created_at => user['created_at'], 
      :friends_count => user['friends_count'], 
      :lang => user['lang'],
      :location => user['location'],
      :profile_image_url => user['profile_image_url'].gsub("_normal", ""), 
      :twitter_id => user['twitter_id']
    )
  end
end
