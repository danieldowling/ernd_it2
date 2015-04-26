class RolesController < ApplicationController

	def index
		@roles = Role.all
	end

	def show
	end

	def edit
	end

	
end
