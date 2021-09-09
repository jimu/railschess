require "test_helper"

class GameTest < ActiveSupport::TestCase
  setup do
    @game = games(:one)
  end

  test "Game status contains a valid value" do
    assert @game.status >= 1 && @game.status <= Game::STATUS_MAX
  end

  test "Game status has a valid description" do
    assert @game.status_description.length > 0
  end

  test "A game with an invalid status is invalid" do
    @game.status = Game::STATUS_MAX + 1
    assert @game.invalid?
  end
end
