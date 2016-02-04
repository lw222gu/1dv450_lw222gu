class ClientsController < ApplicationController
    
    before_action :require_login
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        
        charset = Array('A'..'Z') + Array('a'..'z')
        random = Array.new(10) { charset.sample }.join
        @client.key = DateTime.now.strftime('%s') + random
        @client.user_id = session[:userid]
        
        if @client.save
           #session[:userid] = @user.id 
           flash[:success] = 'Applikationen sparades.'
           redirect_to apikey_path
        else
            flash[:danger] = 'Applikationen kunde inte sparas.'
            render :action => 'new'
        end
    end
    
    def delete
        @client = Client.find(params[:id])
        @client.destroy
        flash[:success] = 'Applikationen raderades.'
        redirect_to apikey_path
    end
    
    def revoke
        @client = Client.find(params[:id])
        @client.active = false
        @client.save
        flash[:success] = 'Applikationen har inaktiverats.'
        redirect_to admin_path
    end
    
    def reactivate
        @client = Client.find(params[:id])
        @client.active = true
        @client.save
        flash[:success] = 'Applikationen har återaktiverats.'
        redirect_to admin_path
    end
    
    private
    def client_params
        params.require(:client).permit(:name, :description, :url)
    end
end
