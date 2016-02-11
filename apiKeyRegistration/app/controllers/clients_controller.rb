class ClientsController < ApplicationController
    
    before_action :require_login
    before_action :fetch_client, only: [:delete, :revoke, :reactivate]
    
    def new
        @client = Client.new
    end
    
    def create
        @client = Client.new(client_params)
        @client.key = DateTime.now.strftime('%s') + SecureRandom.hex(20)
        @client.user_id = session[:userid]
        
        if @client.save
           flash[:success] = 'Applikationen sparades.'
           redirect_to apikey_path
        else
            flash[:danger] = 'Applikationen kunde inte sparas.'
            render :action => 'new'
        end
    end
    
    def delete
        # @client = Client.find(params[:id])
        @client.destroy
        flash[:success] = 'Applikationen raderades.'
        if current_user.admin?
            redirect_to admin_path
        else
            redirect_to apikey_path
        end
    end
    
    def revoke
        # @client = Client.find(params[:id])
        @client.active = false
        @client.save
        flash[:success] = 'Applikationen har inaktiverats.'
        redirect_to admin_path
    end
    
    def reactivate
        # @client = Client.find(params[:id])
        @client.active = true
        @client.save
        flash[:success] = 'Applikationen har återaktiverats.'
        redirect_to admin_path
    end
    
    private
    
    def client_params
        params.require(:client).permit(:name, :description, :url)
    end
    
    private
    
    def fetch_client
      @client = Client.find(params[:id])
    end
end
