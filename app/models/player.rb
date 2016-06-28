class Player < ActiveRecord::Base
  has_many :aliases, class_name: 'PlayerAlias'
  has_many :character_captures

  def self.find_by_alias(value)
    player_alias = PlayerAlias.find_by_value(value)
    return nil if player_alias.nil?
    player_alias.player
  end

  def last_captures(limit=10)
    self.character_captures.limit(10).order('created_at DESC').map(&:character)
  end
end
