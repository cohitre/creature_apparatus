class CharacterCapture < ActiveRecord::Base
  belongs_to :player
  belongs_to :character
end
