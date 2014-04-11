class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  helper_method :require_user
  helper_method :set_metadata

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    redirect_to root_path unless logged_in?
  end

  def set_metadata(title, description, keywords)
    set_meta_tags title: title,
                  description: description,
                  keywords: keywords,
                  og: { title: title, description: description, keywords: keywords }
  end
end
