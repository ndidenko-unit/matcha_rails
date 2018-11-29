class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception


  protected

  def after_sign_in_path_for(resource)
    if current_user.profile.nil?
      edit_profile_path(current_user.id)
    else
      request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end
  end
end
