require_relative '../server'

c = Player.create(display_name: 'carlos')
c.aliases.create(value: 'carlos')
c.aliases.create(value: 'cohitre')

c1 = Character.create(display_name: 'chicken', capture_rate: 255)
c2 = Character.create(display_name: 'pidgey', capture_rate: 255)
c3 = Character.create(display_name: 'paras', capture_rate: 255)

slack = EncounterEnvironment.create(name: 'slack', encounter_rate: 'very_common')

EnvironmentMembership.create(
  encounter_environment: slack,
  character: c1,
  probability: 50
)
EnvironmentMembership.create(
  encounter_environment: slack,
  character: c2,
  probability: 5
)
EnvironmentMembership.create(
  encounter_environment: slack,
  character: c3,
  probability: 50
)
