Dir[File.dirname(__FILE__) + '/elo_ratings/*.rb'].each {|file| require file }

require File.dirname(__FILE__) + '/../ext/bayeselo/elo_ratings'

module EloRatings
  Draw = 1
  Player1Win = 2
  Player2Win = 0
end