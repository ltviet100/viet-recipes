class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:notice] = "Welcome #{@chef.chefname} to the application"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def show
  end

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end

    def set_chef
      @chef = Chef.find(params[:id])
    end
end
