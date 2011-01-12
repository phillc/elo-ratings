// #include <ruby.h>
#include "rice/Class.hpp"
#include "rice/Data_Type.hpp"
#include "rice/Constructor.hpp"
#include "CBradleyTerry.h"
#include "CCondensedResults.h"
#include "CCDistribution.h"
#include "CResultSet.h"


using namespace Rice;

class CBayeselo
{
    public:
        CBayeselo();
        void Append(unsigned w, unsigned b, unsigned r);
        int GetPlayers();
        double GetElo(int i);
        float CountGames(int i);
    private:
        CResultSet rs;
        // CCondensedResults crs;
        // CBradleyTerry bt;
};

CBayeselo::CBayeselo()
        // : crs(rs),
          // bt(crs)
{
}

void CBayeselo::Append(unsigned w, unsigned b, unsigned r) {
    rs.Append(w, b, r);
}

int CBayeselo::GetPlayers() {
    return rs.GetPlayers();
}


double CBayeselo::GetElo(int i) {
    CCondensedResults crs(rs);
    crs.AddPrior(2.0); // CEloRating constructor
    CBradleyTerry bt(crs);
    
    //IDC_MM
    int fThetaW = 0;
    int fThetaD = 0;
    bt.MinorizationMaximization(fThetaW, fThetaD);
    
    
    // int Resolution = 1000;
    // double eloMin = -1500;
    // double eloMax = 1500;
    // CCDistribution cdist(Resolution, eloMin, eloMax);
    // bt.GetPlayerDist(i, cdist);
    
    
    // int eloAdvantage = 0;
    // 
    // bt.SetAdvantage(eloAdvantage);
    
    double x = bt.GetElo(i);
    if (x > 0)
     return int(x+0.5);
    else
     return int(x-0.5);
}

float CBayeselo::CountGames(int i) {
    return rs.CountGames(i);
}

extern "C"
void Init_bayeselo()
{
    Rice::Module mBayeselo = define_module("Bayeselo");
    
    Data_Type<CBayeselo> c_bayeselo =
            define_class_under<CBayeselo>(mBayeselo, "CBayeselo")
            .define_constructor(Constructor<CBayeselo>())
            .define_method("get_players", &CBayeselo::GetPlayers)
            .define_method("append", &CBayeselo::Append)
            .define_method("get_elo", &CBayeselo::GetElo)
            .define_method("count_games", &CBayeselo::CountGames);
    
    
    // Data_Type<CBradleyTerry> rb_bradleyterry = 
    //         define_class_under<CBradleyTerry>(mBayeselo, "CBradleyTerry")
    //         .define_constructor(Constructor<CBradleyTerry, CCondensedResults>())
    //         .define_method("get_elo", &get_elo);
}
