class Character < ActiveRecord::Base
  has_many :environment_memberships
  has_many :character_captures

  def capture_value
    (65536/((255/self.capture_rate) ** 0.75)) / 65536
  end
end
