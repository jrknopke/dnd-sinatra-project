class SpellsController < ApplicationController

    # CREATE

        # New
        get '/spells/new' do
            if logged_in?
                erb :'/spells/new'
            else
                redirect '/login'
            end
        end

        # Create
        post '/spells' do
            spell = current_user.spells.build(params)
            spell.save
            redirect '/spells'
        end

    # READ

        get '/spells' do
            if logged_in?
                @spells = Spell.all.reverse
                erb :'spells/index'
            else
                redirect '/login'
            end
        end

        # Show 
        get '/spells/:id' do
            if logged_in?
                @spell = Spell.find(params[:id])
                erb :'spells/show'
            else
                redirect '/login'
            end
        end
    # UPDATE

        # Edit
        get '/spells/:id/edit' do
            if logged_in?
                @spell = Spell.find(params[:id])
                erb :'/spells/edit'
            else
                redirect '/login'
            end
        end

        #Update
        patch '/spells/:id' do
            @spell = Spell.find(params[:id])

            if !spell.spell_name.empty? && !spell.level.empty?
                @spell.update(params["spell"])
                redirect '/spells/#{params[:id]}'
            else
                @error = "Invalid entries. Please try again"
                erb:'/recipes/edit'
            end
        end

    # DESTROY

        delete '/spells/:id' do
            spell = Spell.find(params[:id])
            spell.destroy
            redirect '/spells'
        end

end