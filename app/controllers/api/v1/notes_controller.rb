#########################
#DateNote - created August 2019 
#current route is api/v1/notes && api/v1/save
#                       index and create
########################


class Api::V1::NotesController < ApplicationController

	def index
		
		@memos = Memo.where(user_id: @user.id)
		render json: @memos
	end

	def create
		#will first check if the date has a note, if not create one or edit the current one
		
		get_user = User.find(note_params["user_id"])
		get_memo = get_user.memos.where(date: note_params["date"])
		
		if get_memo.length > 0
			get_memo.update_all(note: note_params["note"]) 
		else
			get_memo = Memo.create(note_params)
		end

		render json: get_user.memos
	end

	private
	def note_params
		params.require("memo").permit(:note, :user_id, :date) 
	end
end
