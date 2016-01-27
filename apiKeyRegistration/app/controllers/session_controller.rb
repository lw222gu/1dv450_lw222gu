class SessionController < ApplicationController
    
    def index
    end
    
    def login
        u = User.find_by_username(params[:username])
        if u && u.authenticate(params[:password])
            session[:userid] = u.id
            redirect_to apikey_path
        else
            flash[:notice] = 'Fel vid inloggning.'
            redirect_to root_path
        end
    end
    
    def logout
        session[:userid] = nil
        redirect_to root_path, :notice => 'Du har loggat ut'
    end
end
