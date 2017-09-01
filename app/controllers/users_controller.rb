class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def update_manager
    @user = User.find(params['users_lead_generator'][:id])
    @user.update_attributes(parent_id: params['users_lead_generator'][:parent_id])
    redirect_to root_url, notice: 'Updated manager'
  end

end
