class ApikeysController < ApplicationController
    
    #Innan någon av dessa metoder körs, så vill jag kontrollera att användaren är inloggad, via require_login
    before_action :require_login
    
    def show
        
    end
    
end
