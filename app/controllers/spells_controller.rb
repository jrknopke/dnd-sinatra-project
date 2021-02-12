class SpellsController < ApplicationController

    # CREATE

        # New
        # make a get request to '/characters/new'

        # Create
        # make a post request to '/characters'

    # READ
        # Index - make a get request to '/characters'

        get '/spells' do
            @spells = Spell.all
            erb :'spells/index'
        end

        # Show - make a get request to '/characters/:id'
        get '/spells/:id' do
            @spell = Spell.find
            erb :'spells/show'
        end
    # UPDATE

        # Edit
        # make a get request to '/characters/:id/edit'

        #Update
        # make a put request to '/characters/:id'

    # DESTROY

        # make a delete request to '/characters/:id'

end