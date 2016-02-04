class ApikeysController < ApplicationController
    
    before_action :require_login, only: [:show]
    
    def show
        @user = User.find(session[:userid])
    end
    
end
