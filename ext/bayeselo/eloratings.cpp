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
        int GetElo(int i);
        float CountGames(int i);
    private:
        CResultSet rs;
};

CBayeselo::CBayeselo()
{
}

void CBayeselo::Append(unsigned w, unsigned b, unsigned r) {
    rs.Append(w, b, r);
}

int CBayeselo::GetPlayers() {
    return rs.GetPlayers();
}


int CBayeselo::GetElo(int i) {
    CCondensedResults crs(rs);
    crs.AddPrior(2.0); // CEloRating constructor
    CBradleyTerry bt(crs);
    
    //IDC_MM
    int fThetaW = 0;
    int fThetaD = 0;
    bt.MinorizationMaximization(fThetaW, fThetaD);
    
    // advantage 0
    int eloAdvantage = 0;
    bt.SetAdvantage(eloAdvantage);
    
    // RoundDouble(double x)
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
void Init_elo_ratings()
{
    Rice::Module mEloRatings = define_module("EloRatings");
    
    Data_Type<CBayeselo> c_bayeselo =
            define_class_under<CBayeselo>(mEloRatings, "CBayeselo")
            .define_constructor(Constructor<CBayeselo>())
            .define_method("get_players", &CBayeselo::GetPlayers)
            .define_method("append", &CBayeselo::Append)
            .define_method("get_elo", &CBayeselo::GetElo)
            .define_method("count_games", &CBayeselo::CountGames);
}
