module ApplicationHelper
  def create_or_show_profile
    if current_user.profile.present?
      profile_path(current_user.profile)
    else
      edit_profile_path(current_user.id)
    end
  end
end
