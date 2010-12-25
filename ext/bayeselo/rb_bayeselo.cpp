// #include <ruby.h>
#include "rice/Class.hpp"
#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"
#include "CResultSet.h"
#include "CCondensedResults.h"
#include "CBradleyTerry.h"


using namespace Rice;

extern "C"
void Init_bayeselo()
{
    Rice::Module mBayeselo = define_module("Bayeselo");
    
    Data_Type<CResultSet> rb_resultset =
            define_class_under<CResultSet>(mBayeselo, "CResultSet")
            .define_constructor(Constructor<CResultSet>())
            .define_method("get_players", &CResultSet::GetPlayers)
            .define_method("append", &CResultSet::Append);
            
    Data_Type<CCondensedResults> rb_condensed_results = 
            define_class_under<CCondensedResults>(mBayeselo, "CCondensedResults")
            .define_constructor(Constructor<CCondensedResults, CResultSet>());
            
            
    typedef double (CBradleyTerry::*get_elo)(int);
    

    
    Data_Type<CBradleyTerry> rb_bradleyterry = 
            define_class_under<CBradleyTerry>(mBayeselo, "CBradleyTerry")
            .define_constructor(Constructor<CBradleyTerry, CCondensedResults>())
            .define_method("get_elo", get_elo(&CBradleyTerry::GetElo));
}
