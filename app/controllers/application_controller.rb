class ApplicationController < ActionController::Base
    include ErrorHandling
    include Authentication
    include Internationalization


    before_action :require_login
  
    private
  
    def require_login
      unless user_signed_in?
        flash[:danger] = t('pages.index.danger')
        redirect_to new_session_url
      end
    end
end
