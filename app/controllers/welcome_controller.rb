class WelcomeController < ApplicationController 
    before_action :require_logged_in 

    def home
        #this will be under apps/views/welcome/home
    end
end 