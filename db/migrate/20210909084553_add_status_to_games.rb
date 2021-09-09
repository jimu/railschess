class AddStatusToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :status, :integer

    Game.all.each do |r|
      r.update_attribute(:status, 1)
    end
  end
end
