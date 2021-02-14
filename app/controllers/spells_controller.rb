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
            spell.save
            redirect '/spells'
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
            @spell = Spell.find(params[:id])
            erb :'/spells/edit'
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