class SessionsController < ApplicationController
    
    def index
    end
    
    def login
        u = User.find_by_username(params[:username])
        if u && u.authenticate(params[:password])
            session[:userid] = u.id
            redirect_to apikey_path
        else
            flash[:danger] = 'Fel vid inloggning.'
            redirect_to root_path
        end
    end
    
    def logout
        session[:userid] = nil
        flash[:success] = 'Du har loggat ut.'
        redirect_to root_path
    end
end
