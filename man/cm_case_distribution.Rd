% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/misc.R
\name{cm_case_distribution}
\alias{cm_case_distribution}
\title{Calculate case distribution}
\usage{
cm_case_distribution(
  z,
  date_simulation_start,
  date_measurement_start,
  dates_measurement_end,
  age_bounds,
  compart = "cases"
)
}
\description{
Expects dynamic results from a single run; the start date of the simulation;
the date upon which measurement starts; dates marking the end of each measurement period (i.e. n bounds for n measurements);
and age group outer bounds (n+1 bounds for n measurements)
}
