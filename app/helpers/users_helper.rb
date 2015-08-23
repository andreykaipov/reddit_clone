module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email) unless user.email.nil?
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    return image_tag(gravatar_url, 
                     alt: "gravatar based on md5 hash of user's email",
                     class: "gravatar")
  end
end