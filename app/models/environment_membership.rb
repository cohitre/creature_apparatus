class EnvironmentMembership < ActiveRecord::Base
  belongs_to :character
  belongs_to :encounter_environment
end
