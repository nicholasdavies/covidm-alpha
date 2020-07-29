# helper.R
# Internal helper functions

# Stop with error if x does not have the correct class
cm_require_class = function(x, varname, cls)
{
    if (!(cls %in% class(x))) {
        stop(paste0(varname, " must be of class ", cls));
    }
}

# Stop with error if x is not one of choices
cm_require_one_of = function(x, varname, choices)
{
    if (length(x) != 1 || !(x %in% choices)) {
        stop(paste0(varname, " must be one of ", paste(choices, collapse = ", ")));
    }
}
