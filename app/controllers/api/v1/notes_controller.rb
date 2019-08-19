class Api::V1::NotesController < ApplicationController

	def index
		
		@memos = Memo.where(user_id: @user.id)
		render json: @memos
	end
end
