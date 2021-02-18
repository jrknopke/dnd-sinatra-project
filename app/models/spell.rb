class Spell < ActiveRecord::Base
    belongs_to :user
    # validates_presence_of :name, :level, :character_class, :school

end