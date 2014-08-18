module UsersHelper

  def profile_image_for(user)
    gravatar_url = "http://secure.gravatar.com/avatar/#{user.gravatar_id}"
    image_tag(gravatar_url, :alt => "#{user.first_name} #{user.last_name}")
  end

end
