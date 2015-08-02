class RolesController < ApplicationController

	def index
		@roles = Role.all
	end

	def new
		@role = Role.new
	end

	def create
		@role = Role.new(role_params)

		if @role.save
			redirect_to posts_path
		else
			render :new
		end
    end

    def edit
	end

  private

  def set_role
  	@role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end

	
end
