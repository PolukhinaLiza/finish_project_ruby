class UsersController < ApplicationController
    before_action :require_no_authentication, only: %i[new create]
    before_action :require_authentication, only: %i[edit update]
    before_action :set_user!, only: %i[edit update show destroy]
    skip_before_action :require_login, only: %i[new create]
    
    def new
      @user = User.new
    end
    
    def update
        if @user.update user_params
          flash[:success] = t '.success'
          redirect_to edit_user_path(@user)
        else
          render :edit
        end
    end

    def edit
        
    end
    def destroy
        
    end

    def create
      @user = User.new user_params
      if @user.save
        sign_in @user
        flash[:success] = t('.success', name: current_user.name)
        redirect_to root_path
      else
        render :new
      end
    end
  
    private
    def set_user!
        @user = User.find params[:id]
    end

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation, :old_password)
    end
  end