class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  # helpern gör att även vyn kommer åt current_user metoden.  
  helper_method :current_user
  
  def current_user
    # ||= kör koden om den inte är satt. Annars ignoreras koden nedan.
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end
  
  def require_login
    # Om current_user returnerar nil redirectas användaren till startsidan.
    if current_user.nil? then
      flash[:danger] = 'Du måste logga in för att se sidan du efterfrågade.'
      redirect_to root_path
    end
  end
  
end
