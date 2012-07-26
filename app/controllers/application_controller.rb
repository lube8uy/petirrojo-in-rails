class ApplicationController < ActionController::Base

	before_filter :load_sidebar_data

	protected

	  def load_sidebar_data
	  	@top_five = Trend.most_clicked(5)
	  end

end
