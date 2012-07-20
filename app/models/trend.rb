class Trend < ActiveRecord::Base
  attr_accessible :created_at, :name

  def Trend.top_chart(q = 2)
  	fresh_trends = get_fresh_api_trends(q)
  	keynames = []
  	fresh_trends.each do |trend|
  		keynames << trend['name']
  	end
  	found_trends = find(:all, :select => "name", :conditions => {:name => keynames}).map(&:name)
  	new_trends = keynames - found_trends
  	new_trends.each do |name|
  		Trend.create(:name => name)
  	end
  	get_db_trends(q)
  end

  def Trend.twits(id)
  	trend = Trend.find(id)
  	client = TwitterApi.new
  	twits = client.get_twits_for_trend(trend.name).response["results"]
  	result = []
  	twits.each do |twit|
	  	result << Trend.json_twit_to_object(twit)
  	end
  	result
  end

  def Trend.search(term)
    client = TwitterApi.new
    twits = client.get_twits_for_trend(term).response["results"]
    result = []
    twits.each do |twit|
      result << Trend.json_twit_to_object(twit)
    end
    result
  end

  private

  def Trend.get_fresh_api_trends(q = 10)
  	result = []
  	client = TwitterApi.new
  	trends = client.get_trends.response["trends"]
  	trends.each do |hour, hour_trends|
  		result = result | hour_trends
  	end
  	result = result[0,q]
  end

  def Trend.get_db_trends(q = 10)
  	Trend.find(:all, :order => 'id desc', :limit => q)
  end

  def Trend.json_twit_to_object(twit)
    Twit.new(
      :body => twit['text'], 
      :created_at => twit['created_at'], 
      :from_user => twit['from_user'], 
      :from_user_id => twit['from_user_id'],
      :from_user_name => twit['from_user_name'],
      :iso_language_code => twit['iso_language_code'], 
      :profile_image_url => twit['profile_image_url'],
      :source => twit['source'], 
      :to_user => twit['to_user'], 
      :to_user_id => twit['to_user_id'], 
      :to_user_name => twit['to_user_name'],
      :twitter_id => twit['id'],
    )
  end
end
