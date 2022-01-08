module Authentication
    extend ActiveSupport::Concern
  
    included do
      private
      
      def current_user=(user)
        @current_user = user
      end
      
      def current_user
        @current_user ||= User.find_by(id: cookies.signed[:user_id])
      end
  
      def user_signed_in?
        current_user.present?
      end
  
      def require_authentication
        return if user_signed_in?
  
        flash[:warning] = t 'global.flash.not_signed_in'
        redirect_to root_path
      end
  
      def require_no_authentication
        return unless user_signed_in?
  
        flash[:warning] = t 'global.flash.already_signed_in'
        redirect_to root_path
      end
  
      def sign_in(user)
        cookies.signed[:user_id] = { value: user.id, expires: 20.days }
        session[:user_id] = user.id
      end
  
      def sign_out
        cookies.signed[:user_id] = nil
        @current_user = nil
      end
  
      helper_method :current_user, :user_signed_in?
    end
  end