class ApplicationController < ActionController::Base
  rescue_from 'CanCan::AccessDenied' do |_exception|
    redirect_to root_path, alert: 'You are not authorized to access that page.'
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    groups_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
