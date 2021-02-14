class UsersController < ApplicationController

#sign up
    get '/signup' do
        erb :'users/signup.erb'
    end

    post '/signup' do
        user = User.new(params)
        
        if user.username.empty? || user.password.empty?
            @error = "One of the fields was left blank, please enter a username and password"
            erb :'users/signup'
        elsif User.find_by(username: user.username)
            @error = "An account with that username already exists, please use a different username."
            erb :'users/signup'
        else
            user.save
            session[:user_id] = user.id
            redirect '/spells'
        end

    end

#delete the account

end