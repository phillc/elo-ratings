require 'helper'

class TestCBayeselo < Test::Unit::TestCase
  context "add_player" do
    should "add a player to the result set" do
      result_set1 = Bayeselo::CBayeselo.new
      result_set2 = Bayeselo::CBayeselo.new
      result_set1.append 0, 1, 0
      assert_equal 2, result_set1.get_players
      result_set1.append 1, 2, 0
      assert_equal 3, result_set1.get_players
      result_set1.append 3, 4, 0
      assert_equal 5, result_set1.get_players
      assert_equal 0, result_set2.get_players
    end
  end
  
  context "get_elo" do
    should "return the elo of" do
      bayeselo = Bayeselo::CBayeselo.new

      puts bayeselo.get_elo(0)
      puts bayeselo.get_elo(1)
      puts bayeselo.get_elo(2)
      puts bayeselo.get_elo(3)
      puts bayeselo.get_elo(4)
      puts bayeselo.get_elo(5)
      puts bayeselo.get_elo(6)
      puts bayeselo.get_elo(7)
    end
  end
  
  context "count_games" do
    should "return the number of games a player played" do
      result_set = Bayeselo::CBayeselo.new
      result_set.append 0, 1, 0
      result_set.append 2, 3, 0
      result_set.append 2, 0, 0
      result_set.append 11, 12, 0
      assert_equal 2, result_set.count_games(0)
      assert_equal 1, result_set.count_games(1)
      assert_equal 2, result_set.count_games(2)
      assert_equal 1, result_set.count_games(3)
      assert_equal 0, result_set.count_games(10)
      assert_equal 1, result_set.count_games(11)
      assert_equal 1, result_set.count_games(12)
      assert_equal 0, result_set.count_games(13)
    end
  end
end