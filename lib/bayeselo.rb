Dir[File.dirname(__FILE__) + '/bayeselo/*.rb'].each {|file| require file }

require File.dirname(__FILE__) + '/../ext/bayeselo/bayeselo'

module Bayeselo
end