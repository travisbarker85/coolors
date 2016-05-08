class ColorsController < ApplicationController
	before_action :find_color, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	before_action :admin_user_logged?, only: [:edit, :update, :destroy]

	def index
		@colors = Color.all.order("created_at desc")
	end

	def new
		@color = Color.new
	end

	def create
		@color = Color.new color_params

		if @color.save
			redirect_to @color, notice: "Nice."
		else
			render 'new', notice: "Oh no!"
		end

	end

	def show
	end

	def edit
	end

	def update
		if @color.update color_params
			redirect_to @color, notice: "Yeah! Updated!"
		else		
			render 'edit'
		end
	end

	def destroy
		@color.destroy
		redirect_to colors_path
	end

	private

	def color_params
		params.require(:color).permit(:color1, :color2, :color3)
	end

	def find_color
		@color = Color.find(params[:id])		
	end

	def admin_user_logged?
		#if current_user.admin?
		if current_user.id === 2 # adminn account Heroku
			#faz nada
		else
			redirect_to root_path
		end
	end
end