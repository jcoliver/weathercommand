% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/par_summarize_temperature.R
\name{par_summarize_temperature}
\alias{par_summarize_temperature}
\title{Temperature summary statistics calculated in parallel}
\usage{
par_summarize_temperature(temperature, num_cores = NULL, id_index = 1, ...)
}
\arguments{
\item{temperature}{data frame with daily temperature data for each site}

\item{num_cores}{integer indicating number of processors to use; if
\code{NULL} (default), uses one fewer than the number of processors available}

\item{id_index}{integer column index of unique site id}

\item{...}{additional values passed to
\code{\link{summarize_temperature}}}
}
\value{
tibble with temperature summary statistics
}
\description{
A wrapper for \link{summarize_temperature} to perform
temperature summary statistics calculations in parallel.
}
\examples{
\dontrun{
# Season defined by 15 March through 15 November
temperature_summary <- par_summarize_temperature(temperature = temperature_2yr,
                                                 start_month = 3,
                                                 end_month = 11)

# Same as example above, but restrict use to 2 processors
temperature_summary <- par_summarize_temperature(temperature = temperature_2yr,
                                                 start_month = 3,
                                                 end_month = 11,
                                                 num_cores = 2)

# Season defined by 15 March through 15 November output separate rows for
# each year
temperature_summary <- par_summarize_temperature(temperature = temperature_2yr,
                                                 start_month = 3,
                                                 end_month = 11,
                                                 wide = FALSE)
}

}
\seealso{
\code{\link{summarize_temperature}}
}
