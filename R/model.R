# model.R
# basic model-building functions

#' build a model
#' @export
build_model = function(type = "SEI3R", date_start = "2020-01-01", date_end = "2021-01-01", deterministic = T)
{
    # Check parameters
    cm_require_one_of(type, "type", c("SEI3R"))

    # Assemble basic model structure based on "type" parameter.
    if (type == "SEI3R") {
        model = list(
            type = type,
            parameters = list(
                time_step = 0.25,
                date0 = date_start,
                time0 = 0,
                time1 = date_end,
                report_every = 4,
                fast_multinomial = FALSE,
                deterministic = deterministic,
                pop = list(),
                travel = matrix(0, 0, 0),
                processes = NULL
            )
        );
    }

    # Add cm.model class attribute to model
    class(model) = c("cm.model", "list");

    return (model);
}

#' set populations for a model
#' @export
set_populations = function(model, locations, atlas, admin = NULL, refyear = NULL)
{
    # Check parameters
    cm_require_class(model, "model", "cm.model");

    model$parameters$pop = list(
        Default = list(a = 1, b = 2, c = 3)
    );
    model$parameters$travel = diag(length(model$parameters$pop));

    return (model)
}

#' set contact matrices for a model
#' @export
set_contact = function(model, source = "prem2017")
{
    # Check parameters
    cm_require_class(model, "model", "cm.model");

    model$parameters$pop = lapply(model$parameter$pop,
        function(p) { p$contact = c(0, 0, 0, 0); return (p) }
    );

    return (model)
}
