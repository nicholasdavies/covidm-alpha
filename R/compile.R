# compile.R
# for compiling custom C++ functions

#' compile test
#'
#' @export
make_func = function(cpp_code)
{
    # # Variable definitions
    # var_defs = paste(
    #     paste0("    double ", names(priors), " = _theta_[", seq_along(priors) - 1, "];"),
    #     collapse = "\n");
    # cpp_code = paste0("    ", likelihood_code, collapse = '\n');
    #
    # # Function names
    # model_func   = glue::glue("RCppMCMC_model_{name}");
    # model_getter = glue::glue("RCppMCMC_model_{name}_get");

    # Paste together source code
    src = glue::glue(
        '#include <Rcpp.h>',
        # '#include <vector>',
        # '#include <cmath>',
        # '#include <gsl/gsl_rng.h>',
        # '#include <gsl/gsl_randist.h>',
        # '#include <gsl/gsl_sf.h>',
        # '#include <gsl/gsl_cdf.h>',

        # 'double ${model_func}(const std::vector<double>& _theta_) {',
        'double func(double x) {',
             cpp_code,
        '    return 0;',
        '}',

        'typedef double (*cpp_func)(double);',

        '// [[Rcpp::export]]',
        'Rcpp::XPtr<cpp_func> get_cpp_func() {',
        '    return Rcpp::XPtr<cpp_func>(new cpp_func(&func));',
        '}',
        .sep = "\n", .open = "${", .close = "}"
    );

    # Compile source code
    e = new.env();
    Rcpp::sourceCpp(code = src, env = e);
    get_cpp_func = get("get_cpp_func", envir = e);

    # Return function
    get_cpp_func()
}
