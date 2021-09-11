class PlayerHomeController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @mygames = @user.games
    @myplayers = @user.players

    @play_games = []
    @done_games = []
    @finished_games = []
    @archived_games = []

    @user.players.each do |p|
      case p.game.status

        when Game::STATUS_OPEN, Game::STATUS_CLOSED, Game::STATUS_PLAY

          if p.status == Player::STATUS_READY
            @play_games.append p.game
          else
            @done_games.append p.game
          end

        when Game::STATUS_DONE

          @finished_games.append p.game

        when Game::STATUS_ARCHIVED

          @archived_games.append p.game

      end
    end
  end
end
