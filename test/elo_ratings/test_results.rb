require 'helper'

class TestResults < Test::Unit::TestCase
  context "add_game" do
    should "accept the winner and loser and add a game to EloRatings" do
      results = Results.new
      results.add_game "a", 3, Player1Win
      assert_equal 1, results.count_games_for("a")
      assert_equal 1, results.count_games_for(3)
    end
    
    should "record games for the same player" do
      results = Results.new
      results.add_game "a", "f", Player1Win
      results.add_game "e", "a", Player1Win
      results.add_game "k", "a", Player2Win
      results.add_game "a", 1, Player2Win
      assert_equal 4, results.count_games_for("a")
    end
  end
  
  context "count_games_for" do
    should "return zero for a player that hasn't been added to a game yet" do
      results = Results.new
      assert_equal 0, results.count_games_for("a")
    end
  end
  
  context "elo_for" do
    should "have exact opposite elo for two players" do
      results = Results.new
      results.add_game "a", "b", Player1Win
      assert_equal results.elo_for("b"), results.elo_for("a") * -1
    end
    
    should "return nil for for a player that hasn't been recorded yet" do
      results = Results.new
      assert_equal nil, results.elo_for("a")
    end
  end
end