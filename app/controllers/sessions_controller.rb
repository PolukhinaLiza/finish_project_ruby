class SessionsController < ApplicationController
    before_action :require_no_authentication, only: %i[new create]
    before_action :require_authentication, only: :destroy
    skip_before_action :require_login, only: %i[new create]
    
    def new
    end
  
    def create
      user = User.find_by email: params[:email]
      if user&.authenticate(params[:password])
        sign_in user
        flash[:success] = t('.success', name: current_user.name)
        redirect_to root_path
      else
        flash[:warning] = t '.invalid_creds'
        redirect_to new_session_path
      end
    end
  
    def destroy
      sign_out
      flash[:success] = t '.success'
      redirect_to new_session_path
    end
  end