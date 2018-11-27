module ProfilesHelper
  def full_name
    @profile.last_name + ' ' + @profile.first_name
  end
end
