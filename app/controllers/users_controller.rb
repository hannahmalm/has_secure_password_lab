class UsersController < ApplicationController
    
    def new 
    end 


    def create 
        #if user password and password confirmation do not match, recirect to login
        # if   :password != :password_confirmation 
        #     redirect_to controller: 'user', action: 'new'
        # else 
        #     #create a new user and redirects you to the welcome page
        #     User.create(user_params)
        #     redirect_to controller: 'welcome', action: 'home'
        # end 
        @user = User.create(user_params)
        return redirect_to controller: 'users', action: 'new' unless @user.save
        session[:user_id] = @user.id
        redirect_to controller: 'welcome', action: 'home'


    end 

    private 
    
    def user_params 
        params.require(:user).permit(:username, :password, :password_confirmation)
    end 
end 