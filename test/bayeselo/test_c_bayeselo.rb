require 'helper'

Draw = 1
Player1 = 2
Player2 = 0

class TestCBayeselo < Test::Unit::TestCase
  context "append" do
    should "add the players" do
      cbayeselo = Bayeselo::CBayeselo.new
      
      cbayeselo.append 0, 1, Player2
      assert_equal 2, cbayeselo.get_players
      cbayeselo.append 1, 2, Player2
      assert_equal 3, cbayeselo.get_players
      cbayeselo.append 3, 4, Player2
      assert_equal 5, cbayeselo.get_players
      assert_equal 1, cbayeselo.count_games(0)
      assert_equal 2, cbayeselo.count_games(1)
      assert_equal 1, cbayeselo.count_games(3)
      assert_equal 1, cbayeselo.count_games(4)
    end
    
    should "not be global" do
      cbayeselo1 = Bayeselo::CBayeselo.new
      cbayeselo2 = Bayeselo::CBayeselo.new
      
      cbayeselo1.append 0, 1, Player2
      assert_equal 2, cbayeselo1.get_players
      cbayeselo1.append 1, 2, Player2
      assert_equal 3, cbayeselo1.get_players
      cbayeselo1.append 3, 4, Player2
      assert_equal 5, cbayeselo1.get_players
      assert_equal 1, cbayeselo1.count_games(0)
      assert_equal 2, cbayeselo1.count_games(1)
      assert_equal 1, cbayeselo1.count_games(3)
      assert_equal 1, cbayeselo1.count_games(4)
      
      assert_equal 0, cbayeselo2.get_players
    end
  end
  
  context "get_elo" do
    should "return the elo of two head to head players" do
      # ResultSet>addplayer a
      # ResultSet>addplayer b
      # ResultSet>addplayer c
      # ResultSet>addplayer d
      # ResultSet>addresult 0 1 1
      # ResultSet>addresult 2 3 1
      # ResultSet>elo
      # ResultSet-EloRating>mm
      # 00:00:00,00
      # ResultSet-EloRating>ratings
      # Rank Name   Elo    +    - games score oppo. draws 
      #    1 b        5  268  268     1   50%    -5  100% 
      #    2 d        5  268  268     1   50%    -5  100% 
      #    3 a       -5  268  268     1   50%     5  100% 
      #    4 c       -5  268  268     1   50%     5  100%
      
      cbayeselo = Bayeselo::CBayeselo.new
      cbayeselo.append 0, 1, Draw
      cbayeselo.append 2, 3, Draw
      assert_equal -5,  cbayeselo.get_elo(0)
      assert_equal 5, cbayeselo.get_elo(1)
      assert_equal -5, cbayeselo.get_elo(2)
      assert_equal 5,  cbayeselo.get_elo(3)
    end
  end
  
  context "count_games" do
    should "return the number of games a player played" do
      cbayeselo = Bayeselo::CBayeselo.new
      cbayeselo.append 0, 1, Player2
      cbayeselo.append 2, 3, Player2
      cbayeselo.append 2, 0, Player2
      cbayeselo.append 11, 12, Player2
      assert_equal 2, cbayeselo.count_games(0)
      assert_equal 1, cbayeselo.count_games(1)
      assert_equal 2, cbayeselo.count_games(2)
      assert_equal 1, cbayeselo.count_games(3)
      assert_equal 0, cbayeselo.count_games(10)
      assert_equal 1, cbayeselo.count_games(11)
      assert_equal 1, cbayeselo.count_games(12)
      assert_equal 0, cbayeselo.count_games(13)
    end
  end
end