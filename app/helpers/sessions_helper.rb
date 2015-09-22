module SessionsHelper

  # Logs in the given user.
  def log_in(member)
    session[:member_id] = member.id
  end
  def current_user()
  	@current_user ||= User.find_by(id: session[:user_id])
  end
end