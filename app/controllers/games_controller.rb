class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = Game.all
  end

  # GET /games/1 or /games/1.json
  def show
    @board = make_board
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games or /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    respond_to do |format|
    puts game_params
      if @game.update(game_params)
        format.html { redirect_to @game, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: "Game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :status)
    end

    @@PIECE_MAP = {
       'r'=>'♖', 'n'=>'♘', 'b'=>'♗', 'q'=>'♕', 'k'=>'♔', 'p'=>'♙',
       'R'=>'♜', 'N'=>'♞', 'B'=>'♝', 'Q'=>'♛', 'K'=>'♚', 'P'=>'♟'
    }

    # Generate a text character for piece
    def piece_symbol(piece)
      @@PIECE_MAP[piece.player.color[0].upcase == 'W' ?
        piece.name.downcase :
        piece.name.upcase
      ]
     #  &#9820;
    end


    # Generate a text character for piece
    def piece_symbol0(piece)
      
      piece.player.color[0].upcase == 'W' ?
        piece.name.downcase :
        piece.name.upcase
    end

    # Generate a 8x8 grid containing pieces on a chessboard
    def make_board
      squares = Array.new(64)

      @game.pieces.each do |p|
        squares[position_to_ix(p.position)] = piece_symbol(p)
      end

      apply_turns squares

      # board = '='*16 + "\n"
      html_board = "<table class=chess>"

      (7..0).step(-1).each do |r|
        html_board += "<tr>"
        for c in 0..7 do
          # board += ' ' + (squares[r*8+c] || '.')
          html_board += "<td>#{squares[r*8+c]}</td>"
        end
        # board += "\n"
        html_board += "</tr>\n"
      end
      # board += '='*16 + "\n"
      html_board += "</table>\n"

    end

    def position_to_ix(position)
      r = position[1].to_i - 1
      c = position[0].ord - 'a'.ord
      r * 8 + c
    end

    def position_to_rowcol(position)
      r = position[1].to_i - 1
      c = position[0] - 'a'
      [r, c]
    end

    def row(position)
      position[1].to_i
    end

    def col(position)
      position[0] - 'a'
    end


    def apply_turns(squares)
      @game.moves.order(:turn).each do |move|
        start = position_to_ix(move.orders[0..1])
        dest  = position_to_ix(move.orders[3..4])

        squares[dest] = squares[start]
        squares[start] = nil
      end
    end
end
