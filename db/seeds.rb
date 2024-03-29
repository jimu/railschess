# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#
ActiveRecord::Base.connection.execute('delete from sqlite_sequence where name="users"')
ActiveRecord::Base.connection.execute('delete from sqlite_sequence where name="games"')
ActiveRecord::Base.connection.execute('delete from sqlite_sequence where name="players"')
ActiveRecord::Base.connection.execute('delete from sqlite_sequence where name="pieces"')
ActiveRecord::Base.connection.execute('delete from sqlite_sequence where name="moves"')


jimu  = User.create name: 'Jim',   email: 'jimu@jimu.net', password:'goblin', password_confirmation:'goblin'
steve = User.create name: 'Steve', email: 'steve@jimu.net', password:'goblin', password_confirmation:'goblin'

User.create([
  {name: 'Mark',  email: 'markr@markr.net', password:'goblin', password_confirmation:'goblin'},
  {name: 'Kirk',  email: 'kirkb@kirkb.net', password:'goblin', password_confirmation:'goblin'},
])

Game.create([
  {name: 'G001', status: Game::STATUS_PLAY},
  {name: 'G002', status: Game::STATUS_OPEN},
])

g001 = Game.first


Player.create([
  {user: jimu,  game: g001, color:'W', status: Player::STATUS_READY },
  {user: steve, game: g001, color:'B', status: Player::STATUS_DONE },
  {user_id: 2, game_id: 2, color:'W',  status: Player::STATUS_READY },
  {user_id: 3, game_id: 2, color:'B',  status: Player::STATUS_DONE },
])

p1 = Player.first
p2 = Player.second

Piece.create([
  {name: 'R', position: 'a1', game: g001, player_id: 1},
  {name: 'N', position: 'b1', game: g001, player_id: 1},
  {name: 'B', position: 'c1', game: g001, player_id: 1},
  {name: 'Q', position: 'd1', game: g001, player_id: 1},
  {name: 'K', position: 'e1', game: g001, player_id: 1},
  {name: 'B', position: 'f1', game: g001, player_id: 1},
  {name: 'N', position: 'g1', game: g001, player_id: 1},
  {name: 'R', position: 'h1', game: g001, player_id: 1},
  {name: 'P', position: 'a2', game: g001, player_id: 1},
  {name: 'P', position: 'b2', game: g001, player_id: 1},
  {name: 'P', position: 'c2', game: g001, player_id: 1},
  {name: 'P', position: 'd2', game: g001, player_id: 1},
  {name: 'P', position: 'e2', game: g001, player_id: 1},
  {name: 'P', position: 'f2', game: g001, player_id: 1},
  {name: 'P', position: 'g2', game: g001, player_id: 1},
  {name: 'P', position: 'h2', game: g001, player_id: 1},
  {name: 'R', position: 'a8', game: g001, player_id: 2},
  {name: 'N', position: 'b8', game: g001, player_id: 2},
  {name: 'B', position: 'c8', game: g001, player_id: 2},
  {name: 'K', position: 'd8', game: g001, player_id: 2},
  {name: 'Q', position: 'e8', game: g001, player_id: 2},
  {name: 'B', position: 'f8', game: g001, player_id: 2},
  {name: 'N', position: 'g8', game: g001, player_id: 2},
  {name: 'R', position: 'h8', game: g001, player_id: 2},
  {name: 'P', position: 'a7', game: g001, player_id: 2},
  {name: 'P', position: 'b7', game: g001, player_id: 2},
  {name: 'P', position: 'c7', game: g001, player_id: 2},
  {name: 'P', position: 'd7', game: g001, player_id: 2},
  {name: 'P', position: 'e7', game: g001, player_id: 2},
  {name: 'P', position: 'f7', game: g001, player_id: 2},
  {name: 'P', position: 'g7', game: g001, player_id: 2},
  {name: 'P', position: 'h7', game: g001, player_id: 2},
])


Move.create([
  {turn: 1, orders: "b2-b4", game: g001, player_id: 1},
  {turn: 2, orders: "b7-b5", game: g001, player_id: 2},
])
