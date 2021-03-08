class SessionsController < ApplicationController
    
    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        # binding.pry
        if params["username"].empty? || params["password"].empty?
            @error = "One of the fields was left blank, please enter a username and password"
            erb :'users/login'
        else
            user = User.find_by(username: params["username"])
            if user.authenticate(params["password"])
                session[:user_id] = user.id
                redirect '/spells'
            else
                @error = "Account not found."
                erb :'users/login'
            end
        end
    end

    #user can log out
    get '/logout' do
        session.clear
        redirect '/'
    end

end