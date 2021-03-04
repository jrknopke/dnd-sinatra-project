class Spell < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :spell_name, :level
end