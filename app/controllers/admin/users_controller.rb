class Admin::UsersController < ApplicationController

    before_action :authenticate_admin!
    before_action :set_user, only: %i[show update]
  
    def index
      @users = User.latest
    end
  
    def show; end
  
    def update
      @user.update(user_params)
      redirect_to request.referer, notice: 'Successfully updated user status'
    end
  
    private
  
    def set_user
      @user= user.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:status)
    end
  end