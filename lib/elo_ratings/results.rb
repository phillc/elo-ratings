module EloRatings
  class Results
    def initialize
      @c_bayeselo = CBayeselo.new
      @players = []
    end
  
    def add_game players={}
      players[:winner]
      players[:loser]
    end
  end
end