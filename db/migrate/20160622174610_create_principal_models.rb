class CreatePrincipalModels < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'

    create_table :players, id: :uuid do |t|
      t.timestamps null: false
      t.string :display_name, null: false
    end

    create_table :player_aliases, id: :uuid do |t|
      t.timestamps null: false
      t.string :value, null: false
      t.uuid :player_id, null: false, type: :uuid
    end

    create_table :encounter_environments, id: :uuid do |t|
      t.timestamps null: false
      t.string :name, null: false
      t.string :encounter_rate, null: false
    end

    create_table :characters, id: :uuid do |t|
      t.timestamps null: false
      t.string :display_name, null: false
      t.integer :capture_rate, null: false
    end

    create_table :environment_memberships, id: :uuid do |t|
      t.timestamps null: false
      t.uuid :encounter_environment_id, null: false, type: :uuid
      t.uuid :character_id, null: false, type: :uuid
      t.integer :probability, null: false
    end

    add_index :encounter_environments, :name, unique: true
    add_index :characters, :display_name, unique: true
    add_index :environment_memberships, [:encounter_environment_id, :character_id], unique: true, name: 'index_environment_memberships_on_environment_and_character'
    add_index :players, :display_name, unique: true
    add_index :player_aliases, :value, unique: true
  end
end
