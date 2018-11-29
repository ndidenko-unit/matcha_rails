module ProfilesHelper
  def full_name(profile)
    profile.last_name + ' ' + profile.first_name
  end
end
