class UsersController < ApplicationController
    
    def index
        
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
           session[:userid] = @user.id 
           flash[:success] = 'Du är nu en registrerad användare.'
           redirect_to apikey_path
        else
            flash[:danger] = 'Något gick fel vid registreringen.'
            render :action => 'new'
        end
        
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
