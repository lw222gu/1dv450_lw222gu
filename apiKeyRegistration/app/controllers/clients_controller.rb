class ClientsController < ApplicationController
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        @client.key = '123'
        @client.user_id = session[:userid]
        
        if @client.save
           #session[:userid] = @user.id 
           redirect_to apikey_path
        else
            flash[:danger] = 'Applikationen kunde inte sparas.'
            render :action => 'new'
        end
    end
    
    def delete
    end
    
    private
    def client_params
        params.require(:client).permit(:name, :description, :url)
    end
end
