class RemovePlayerIdInTeam < ActiveRecord::Migration
  def change
    remove_foreign_key :teams, :player
  end
end
