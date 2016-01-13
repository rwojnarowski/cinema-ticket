module ApplicationHelper

  def user_admin?
    !current_user.level == 1
  end

end
