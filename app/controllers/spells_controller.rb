class SpellsController < ApplicationController

    before do 
        require_login
    end
    
    # CREATE

        # New
        get '/spells/new' do
            erb :'/spells/new'
        end

        # Create
        post '/spells' do
            spell = current_user.spells.build(params)
            if spell.valid?
                spell.save
                redirect '/spells'
            else
                @error = "Spells must have a Name, Class, Level, and School."
                erb :'/spells/new'
            end
        end

    # READ

        get '/spells' do
            @spells = Spell.all.reverse
            erb :'spells/index'
        end

        # Show 
        get '/spells/:id' do
            @spell = Spell.find_by(id: params[:id])
            if @spell
                erb :'spells/show'
            else
                redirect '/spells'
            end
        end
    
    # UPDATE

        # Edit
        get '/spells/:id/edit' do
            @spell = find_spell
            if current_user.id == @spell.user_id
                erb :'/spells/edit'
            else
                redirect '/spells'
            end
        end

        #Update
        patch '/spells/:id' do
            @spell = Spell.find(params[:id])
            @spell.update(params["spell"])
            redirect "/spells/#{params[:id]}"
        end

    # DESTROY

        delete '/spells/:id' do
            spell = find_spell
            if spell.user == current_user
                spell.destroy
                redirect '/spells'
            else
                redirect '/spells'
            end
        end
end