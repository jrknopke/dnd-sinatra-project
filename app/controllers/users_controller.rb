class UsersController < ApplicationController

#sign up
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect '/spells'
        else
            @error = "Invalid entry."
            erb :'users/signup'
        end
    end

end