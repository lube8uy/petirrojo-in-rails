class TwiterersController < ApplicationController

	def show
		@user = Twiterer.find_by_id(params['id'])
	end

end
