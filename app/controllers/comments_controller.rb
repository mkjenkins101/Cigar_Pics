class CommentsController < ApplicationController

	def index
		@comments = get_pin_comments 
		render :json => { comments: @comments }
	end

	def create
		Comment.create(pin_id: params[:pin_id], user_id: current_user.id, comment: params[:body])
		render :json => { comments: @comments }
	end

	private 
		# return array of comment objects for the given pin
		def get_pin_comments
			allC = []
			Comment.all.each do |c|
				if c.pin_id == params[:pin_id].to_i 
					cO = {
						user: User.find(c.user_id).name,
						body: c.comment
					}
      	allC << cO
				end
      end
			allC
		end
end
