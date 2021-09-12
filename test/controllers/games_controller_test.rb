require "test_helper"

class GamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game = games(:one)
    login
  end

  test "should get index" do
    get games_url
    assert_response :success
  end

  test "should get new" do
    get new_game_url
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post games_url, params: { game: { name: @game.name, status: @game.status } }
    end

    assert_redirected_to game_url(Game.last)
  end

  test "should show game" do
    get game_url(@game)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_url(@game)
    assert_response :success
  end

  test "should update game" do
    patch game_url(@game), params: { game: { name: @game.name } }
    assert_redirected_to game_url(@game)
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete game_url(@game)
    end

    assert_redirected_to games_url
  end

  test "should have Submit Move link when READY player visits game page" do
    get game_path games(:gamex)
    assert_select "input[value='Submit Move']"
  end

  test "should NOT have Submit Move link when NOT READY player visits game page" do
    get game_path games(:gamey)
    assert_select "input[value='Submit Move']", {count: 0}
  end

  test "Closed game should have 1 DONE and 1 INVITE player" do
    # LESSON - This is not a controller test!
    gamei = games(:gamei)
    num_done_players   = gamei.players.count {|p| p.status == Player::STATUS_DONE}
    num_invite_players = gamei.players.count {|p| p.status == Player::STATUS_INVITE}

    assert num_done_players == 1
    assert num_invite_players == 1
  end

  test "Creating a closed game should have 1 DONE and 1 INVITE player" do
    # how do I simulate "creating" a game? What am I testing?
    #   * edit form?
    #   * create action?
    badgame_params = {game: {name: 'badgame', status: Game::STATUS_CLOSED}}
    post games_path, params: badgame_params
    post games_url,  params: { game: { name: @game.name, status: @game.status } }
    assert_response :not_acceptable
    # assert_redirected_to game_url(Game.last)

  end

end
