class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource
  before_filter :check_authorized_url

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "admin"
    end
  end

  def authenticate_admin
    unless (user_signed_in? and current_user.manager)
      redirect_to '/users/sign_in'
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    root_path
  end

  private
  
  def check_authorized_url
    if current_user and current_user.manager and params[:controller] == 'rooms' and params[:action] == 'index'
      redirect_to admin_rooms_path
    end
  end

end
