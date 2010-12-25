require 'helper'

class TestCResultSet < Test::Unit::TestCase
  context "add_player" do
    should "add a player to the result set" do
      result_set1 = Bayeselo::CResultSet.new
      result_set2 = Bayeselo::CResultSet.new
      result_set1.append 0, 1, 0
      result_set1.append 1, 2, 0
      assert_equal 3, result_set1.get_players
      assert_equal 0, result_set2.get_players
    end
  end
end