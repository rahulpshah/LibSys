module SessionsHelper

  # Logs in the given user.
  def log_in(user)
      session[:user_id] = user.id
  end
  def current_user
  	@current_user ||= Member.find_by(id: session[:user_id])
    @current_user ||= Admin.find_by(id: session[:user_id])
  end
 # def current_admin
  #  @current_admin ||= Admin.find_by(id: session[:user_id])
  #end
  def logged_in?
    if !(current_user.nil?) 
      current_user 
    else
      nil
    end
  end
  def log_out
     session[:user_id] = nil
  end
end
