Dir[File.dirname(__FILE__) + '/elo_ratings/*.rb'].each {|file| require file }

require File.dirname(__FILE__) + '/../ext/bayeselo/elo_ratings'

module EloRatings
end