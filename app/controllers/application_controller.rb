class ApplicationController < ActionController::Base

	before_filter :load_sidebar_data

	protected

	def load_sidebar_data
		@top_five = Trend.most_clicked(5)
	end

	def render_404
    	render :template => 'error_pages/404', :layout => false, :status => :not_found
  	end

end
