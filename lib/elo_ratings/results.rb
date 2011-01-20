module EloRatings
  class Results
    def initialize
      @c_bayeselo = CBayeselo.new
      @players = []
    end
  
    def add_game player_1, player_2, result
      @c_bayeselo.append index_for!(player_1), index_for!(player_2), result
    end
    
    def count_games_for player
      return 0 if !exists? player
      @c_bayeselo.count_games(index_for(player)).to_i
    end
    
    def elo_for player
      return nil if !exists? player
      @c_bayeselo.get_elo index_for(player)
    end
    
    protected
    
    def exists? player
      !!index_for(player)
    end
    
    def index_for player
      @players.index player
    end
    
    def index_for! player
      index = index_for player
      if index.nil?
        index = @players.length
        @players << player
      end
      index
    end
  end
end