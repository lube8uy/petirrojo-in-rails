class TrendsController < ApplicationController

	def index
		@trends = Trend.top_chart(10)
	end

	def show
		@twits = Trend.twits(params['id'])
		@trend = Trend.find(params['id'])
	end

	def search
		@twits = Trend.search(params['q'])
		@trend = Trend.new(:name => params['q'])
		render :template => 'trends/show'
	end

end
