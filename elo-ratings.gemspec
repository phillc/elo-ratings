# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{elo-ratings}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["phillc"]
  s.date = %q{2011-01-19}
  s.description = %q{Ruby wrapper for bayeselo}
  s.email = %q{spyyderz@gmail.com}
  s.extensions = ["ext/bayeselo/extconf.rb", "ext/bayeselo/extconf.rb"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "elo-ratings.gemspec",
    "ext/bayeselo/.gitignore",
    "ext/bayeselo/CBradleyTerry.cpp",
    "ext/bayeselo/CBradleyTerry.h",
    "ext/bayeselo/CCDistribution.cpp",
    "ext/bayeselo/CCDistribution.h",
    "ext/bayeselo/CCDistributionCUI.cpp",
    "ext/bayeselo/CCDistributionCUI.h",
    "ext/bayeselo/CCondensedResults.cpp",
    "ext/bayeselo/CCondensedResults.h",
    "ext/bayeselo/CDiscretization.h",
    "ext/bayeselo/CDistribution.cpp",
    "ext/bayeselo/CDistribution.h",
    "ext/bayeselo/CDistributionCollection.cpp",
    "ext/bayeselo/CDistributionCollection.h",
    "ext/bayeselo/CEloRatingCUI.cpp",
    "ext/bayeselo/CEloRatingCUI.h",
    "ext/bayeselo/CIndirectCompare.h",
    "ext/bayeselo/CJointBayesian.cpp",
    "ext/bayeselo/CJointBayesian.h",
    "ext/bayeselo/CLUDecomposition.cpp",
    "ext/bayeselo/CLUDecomposition.h",
    "ext/bayeselo/CMatrix.cpp",
    "ext/bayeselo/CMatrix.h",
    "ext/bayeselo/CMatrixIO.cpp",
    "ext/bayeselo/CMatrixIO.h",
    "ext/bayeselo/CPredictionCUI.cpp",
    "ext/bayeselo/CPredictionCUI.h",
    "ext/bayeselo/CResultSet.cpp",
    "ext/bayeselo/CResultSet.h",
    "ext/bayeselo/CResultSetCUI.cpp",
    "ext/bayeselo/CResultSetCUI.h",
    "ext/bayeselo/CTimeIO.cpp",
    "ext/bayeselo/CTimeIO.h",
    "ext/bayeselo/CVector.cpp",
    "ext/bayeselo/CVector.h",
    "ext/bayeselo/EloDataFromFile.cpp",
    "ext/bayeselo/EloDataFromFile.h",
    "ext/bayeselo/README",
    "ext/bayeselo/ReadLineToString.cpp",
    "ext/bayeselo/ReadLineToString.h",
    "ext/bayeselo/chtime.cpp",
    "ext/bayeselo/chtime.h",
    "ext/bayeselo/chtimer.h",
    "ext/bayeselo/clktimer.cpp",
    "ext/bayeselo/clktimer.h",
    "ext/bayeselo/consolui.cpp",
    "ext/bayeselo/consolui.h",
    "ext/bayeselo/const.cpp",
    "ext/bayeselo/const.h",
    "ext/bayeselo/date.cpp",
    "ext/bayeselo/date.h",
    "ext/bayeselo/debug.h",
    "ext/bayeselo/elomain.cpp",
    "ext/bayeselo/eloratings.cpp",
    "ext/bayeselo/extconf.rb",
    "ext/bayeselo/list.h",
    "ext/bayeselo/listi.h",
    "ext/bayeselo/move.cpp",
    "ext/bayeselo/move.h",
    "ext/bayeselo/pgn.h",
    "ext/bayeselo/pgnlex.cpp",
    "ext/bayeselo/pgnlex.h",
    "ext/bayeselo/pgnstr.cpp",
    "ext/bayeselo/piece.h",
    "ext/bayeselo/player.h",
    "ext/bayeselo/position.h",
    "ext/bayeselo/random.cpp",
    "ext/bayeselo/random.h",
    "ext/bayeselo/readstr.cpp",
    "ext/bayeselo/readstr.h",
    "ext/bayeselo/square.h",
    "ext/bayeselo/str.cpp",
    "ext/bayeselo/str.h",
    "ext/bayeselo/version.cpp",
    "ext/bayeselo/version.h",
    "ext/bayeselo/version_number.h",
    "lib/elo_ratings.rb",
    "lib/elo_ratings/c_bayeselo.rb",
    "lib/elo_ratings/results.rb",
    "test/elo_ratings/test_c_bayeselo.rb",
    "test/elo_ratings/test_results.rb",
    "test/helper.rb"
  ]
  s.homepage = %q{http://github.com/phillc/elo-ratings}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby wrapper for bayeselo}
  s.test_files = [
    "test/elo_ratings/test_c_bayeselo.rb",
    "test/elo_ratings/test_results.rb",
    "test/helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rice>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rice>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rice>, [">= 0"])
  end
end

