class AdminsController < ApplicationController
    
    before_action :check_admin_rights
    
    def show
        @user = User.find(session[:userid])
        @clients = Client.all
    end
end