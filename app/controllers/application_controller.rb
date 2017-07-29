class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def login_user(user)
    session[:user_id] = user.id
  end

  def redirect_on_error(message, path = nil)
    flash[:error] = message
    if path
      redirect_to(path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def redirect_on_success(message, path = nil)
    flash[:notice] = message
    if path
      redirect_to(path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def return_to_or(path)
    if session[:return_to].present?
      path = session[:return_to]
      session.delete(:return_to)
    end
    path
  end
end
