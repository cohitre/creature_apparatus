class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :character_captures, id: :uuid do |t|
      t.timestamps null: false
      t.uuid :player_id, null: false, type: :uuid
      t.uuid :character_id, null: false, type: :uuid
    end
  end
end
