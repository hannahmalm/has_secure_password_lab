class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user 

  #A user is a current user if their session is set OR if they do User.new
  def current_user
    @user = (User.find_by(id: session[:user_id]) || User.new)
  end 

  # a user is logged in if their id is not nil 
  def logged_in?
    current_user.id != nil 
  end 

  #if you are not logged in, redirect to the session/new to create a new session
  def require_logged_in 
    return redirect_to(controller: 'sessions', action: 'new') unless logged_in? 
  end 
end
