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

    # Select atlas
    if (atlas == "worldpop") {
        dat = dat_worldpop;
    } else if (atlas == "wpp") {
        dat = dat_wpp2019;
    } else if (atlas == "uk") {
        dat = dat_uk;
    } else {
        stop("Unknown atlas ", atlas, ".");
    }

    # TODO think about this . . .
    if (!is.null(refyear)) {
        stop("Ref year not supported.");
    }

    # TODO Redo with admin
    data = dat[name == locations];

    names = data[, unique(name)];

    print(paste0("Loading ", names));

    i = 1;
    model$parameters$pop = list();
    for (n in names) {
        p = cm_base_pop_SEI3R(nrow(data[name == n]));
        p$name = n;
        p$code = data[name == n, unique(code)][1];
        p$group_names = as.character(data[name == n, group]);
        p$size = data[name == n, f + m];

        model$parameters$pop[[i]] = p;
        i = i + 1;
    }

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
