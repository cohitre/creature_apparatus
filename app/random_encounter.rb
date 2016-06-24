class RandomEncounter
  def self.roll_random(player_name, environment_name)
    player = Player.find_by_alias(player_name)
    environment = EncounterEnvironment.find_by_name(environment_name)

    return self.new(player, environment, nil, nil) unless self.random_success?(environment.encounter_probability)

    character = environment.character_for_die_roll(rand(environment.memberships_sum))

    4.times do
      if self.random_success?(character.capture_value)
        capture = CharacterCapture.create(
          player: player,
          character: character
        )
        return self.new(player, environment, character, capture)
      end
    end

    return self.new(player, environment, character, nil)
  end

  def self.random_success?(probability)
    rand < probability
  end

  def initialize(player, environment, character, capture)
    @player = player
    @environment = environment
    @character = character
    @capture = capture
  end

  def captured?
    !@capture.nil?
  end

  def battle?
    !@character.nil?
  end

  def to_slack_message
    return { text: self.summary }
  end

  def summary
    return 'There are no creatures around' unless battle?

    if captured?
      return "A random #{@character.display_name} appears.\nGotcha! #{@character.display_name} was caught!"
    else
      return "A random #{@character.display_name} appears.\nOh, no! It broke free!"
    end
  end
end
