json.extract! player, :id, :color, :game_id, :user_id, :created_at, :updated_at
json.url player_url(player, format: :json)
