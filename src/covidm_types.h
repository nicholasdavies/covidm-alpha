// covidm_types.h
#include <vector>

struct Parameters;
class Randomizer;
class Reporter;

typedef double (*cpp_func)(double x);

typedef void (*cm_changes_func)       (Parameters&, Randomizer&, Reporter&, const std::vector<double>&);
typedef void (*cm_loglikelihood_func) (Parameters&, Randomizer&, Reporter&, const std::vector<double>&);
typedef void (*cm_observer_func)      (Parameters&, Randomizer&, Reporter&, const std::vector<double>&, double);
