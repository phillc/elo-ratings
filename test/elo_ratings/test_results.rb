require 'helper'

class TestEloRatings < Test::Unit::TestCase
  context "add_game" do
    should_eventually "accept the winner and loser and add a game to EloRatings" do
      EloRatings = EloRatings.new
      EloRatings.add_game :winner => "a", :loser => "b"
      assert_equal 1, EloRatings.count_games("a")
      assert_equal 1, EloRatings.count_games("b")
    end
    
    should_eventually "record games for the same player" do
      EloRatings = EloRatings.new
      EloRatings.add_game :winner => "a", :loser => "f"
      EloRatings.add_game :winner => "e", :loser => "a"
      EloRatings.add_game :winner => "a", :loser => "k"
      assert_equal 3, EloRatings.count_games("a")
    end
  end
  
  context "get_elo" do
    should_eventually "have exact opposite elo for two players" do
      EloRatings = EloRatings.new
      EloRatings.add_game :winner => "a", :loser => "b"
      assert_equal EloRatings.get_elo("b"), -EloRatings.get_elo("a")
    end
    
    should_eventually "return nil for for a player that hasn't been recorded yet" do
      EloRatings = EloRatings.new
      assert_equal nil, EloRatings.get_elo("a")
    end
  end
end