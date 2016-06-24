class EncounterEnvironment < ActiveRecord::Base
  has_many :environment_memberships

  ENCOUNTER_RATE_MAPPINGS = {
    very_common: 1.0,
    common: 0.085,
    semi_rate: 0.0675,
    rare: 0.0333,
    very_rare: 0.0125
  }

  def encounter_probability
    ENCOUNTER_RATE_MAPPINGS[self.encounter_rate.to_sym]
  end

  def memberships_sum
    environment_memberships.map(&:probability).inject(0, :+)
  end

  def character_for_die_roll(target)
    environment_memberships.each do |mem|
      return mem.character if target <= mem.probability
      target -= mem.probability
    end
  end
end
