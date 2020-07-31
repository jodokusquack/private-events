module UsersHelper
  def is_requested_user?
    current_user == @user
  end
end
