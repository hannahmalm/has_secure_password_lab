class User < ActiveRecord::Base 
    has_secure_password
end 

#this is standard but needs to be used with the bcrypt gemfile 
