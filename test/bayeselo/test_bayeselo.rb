require 'helper'

class TestBayeselo < Test::Unit::TestCase
  context "add_game" do
    should "accept the winner and loser and add a game to bayeselo" do
      bayeselo = Bayeselo.new
      bayeselo.add_game :winner => "a", :loser => "b"
      assert_equal 1, bayeselo.count_games("a")
      assert_equal 1, bayeselo.count_games("b")
    end
    
    should "record games for the same player" do
      bayeselo = Bayeselo.new
      bayeselo.add_game :winner => "a", :loser => "f"
      bayeselo.add_game :winner => "e", :loser => "a"
      bayeselo.add_game :winner => "a", :loser => "k"
      assert_equal 3, bayeselo.count_games("a")
    end
  end
  
  context "get_elo" do
    should "have exact opposite elo for two players" do
      bayeselo = Bayeselo.new
      bayeselo.add_game :winner => "a", :loser => "b"
      assert_equal bayeselo.get_elo("b"), -bayeselo.get_elo("a")
    end
    
    should "return nil for for a player that hasn't been recorded yet" do
      bayeselo = Bayeselo.new
      assert_equal nil, bayeselo.get_elo("a")
    end
  end
end