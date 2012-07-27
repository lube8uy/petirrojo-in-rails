class TrendsController < ApplicationController

	def index
		@trends = Trend.top_chart(20)
	end

	def show
		@trend = Trend.find(params['id']) || raise("not found")
		@twits = Trend.twits(params['id'])
	end

	def search
		@twits = Trend.search(params['q'])
		@trend = Trend.new(:name => CGI::unescape(params['q']))
		render :template => 'trends/show'
	end

end
