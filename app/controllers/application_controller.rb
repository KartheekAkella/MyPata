class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_filter :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?



protected
def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up, keys: [:nick])
 #devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
 devise_parameter_sanitizer.permit(:sign_up, keys: [:intro])
end

end
