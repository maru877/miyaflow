module UsersHelper
  def profile_img(user)

  if user.avatar.blank?
    img_url = 'no_image.png'
  else
    img_url = user.avatar
  end
  image_tag(img_url, alt: user.name)
  end
end
