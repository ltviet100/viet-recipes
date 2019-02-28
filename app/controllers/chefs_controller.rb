class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef.id
      flash[:notice] = "Welcome #{@chef.chefname} to the application"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:notice] = "Your account updated successfully!"
      redirect_to chef_path(@chef)
    else
      render 'edit'
    end
  end

  def destroy
    @chef.destroy
    flash[:danger] = 'Chef and all associated recipes have been removed!'
    redirect_to chefs_path
  end

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end

    def set_chef
      @chef = Chef.find(params[:id])
    end
end
