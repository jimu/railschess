class AddStatusToPlayers < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :status, :integer
  end
end
