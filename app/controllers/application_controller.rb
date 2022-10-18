class ApplicationController < ActionController::Base
  before_action :config_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    languages_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  private

  def config_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[last_name first_name age email])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[last_name first_name age email])
  end
end
