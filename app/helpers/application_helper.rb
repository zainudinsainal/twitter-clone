module ApplicationHelper

  def current_user?(user)
    user == current_user
  end

  def display_avatar(user)  
    unless user.avatar.nil? 
      image_tag(user.avatar.file_name) 
    else
      image_tag("/assets/images/picture.jpg")
     end    
  end

end
