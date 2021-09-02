class SessionsController < ApplicationController
    def new
        #This action creates a new session 
    end 

    #post create logs you in with the correct password
    #post create rejects invalid passwords
    #post create rejects empty passwords
    def create 
        #first, find the uesr by the name and password they enter
        #@user = User.find_by(name: params[:user][:name])
        user = User.find_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:password])
        #MUST explicitly say return to reject invalid or empty passwords
        return redirect_to(controller: 'sessions', action: 'new') unless user 

        #second, authenticate the user or give an error
        #return head(:forbidden) unless @user.authenticate(params[:user][:name])

        #set the session to the user.id
        session[:user_id] = user.id 

        redirect_to controller: 'welcome', action: 'home'
    end 

    def destroy 
        session.delete :user_id 
        redirect_to '/'
    end 

    

end 