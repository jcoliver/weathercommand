% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summarize_rainfall.R
\name{summarize_rainfall}
\alias{summarize_rainfall}
\title{Rainfall summary statistics}
\usage{
summarize_rainfall(
  rain,
  start_month,
  end_month,
  start_day = 15,
  end_day = start_day,
  rain_cutoff = 1,
  na.rm = TRUE,
  wide = TRUE,
  id_index = 1,
  date_sep = "_"
)
}
\arguments{
\item{rain}{data frame with daily rainfall data for each site}

\item{start_month}{numeric starting month defining season (inclusive)}

\item{end_month}{numeric ending month defining season (inclusive)}

\item{start_day}{numeric day of starting month defining season
(inclusive); defaults to 15}

\item{end_day}{numeric day of ending month defining season (inclusive);
defaults to \code{start_day}}

\item{rain_cutoff}{numeric minimum value for daily rainfall to be counted as
a rain day}

\item{na.rm}{logical passed to summary statistic functions indicating
treatment of \code{NA} values}

\item{wide}{logical indicating whether or not to output as wide-
formatted data}

\item{id_index}{integer column index of unique site id}

\item{date_sep}{character used to delimit variable prefix from date in
column names; defaults to underscore ("_")}
}
\value{
tibble with rainfall summary statistics
If \code{wide = FALSE}, returns values for each year for each site:
\describe{
  \item{mean_season}{Mean rainfall for the season}
  \item{median_season}{Median rainfall for the season}
  \item{sd_season}{Standard deviation of rainfall for the season}
  \item{total_season}{Total rainfall rainfall over the season}
  \item{skew_season}{Skew of rainfall for the season, where skew is defined
  by (mean - median)/sd}
  \item{norain}{Total number of days with rain less than \code{rain_cutoff}}
  \item{raindays}{Total number of days with rain greater than or equal to
  \code{rain_cutoff}}
  \item{percent_raindays}{Percentage of days in season with rain greater than
  or equal to \code{rain_cutoff}}
  \item{dry}{Longest stretch of days with less than \code{rain_cutoff}
  contained within the period; if rainfall was less than \code{rain_cutoff}
  for every day in defined season, the returned value will be zero}
  \item{dry_start}{Number of consecutive days at beginning of season with
  less than \code{rain_cutoff} of measured rain; if first day of season had
  rainfall greater than or equal to \code{rain_cutoff}, the returned value
  will be zero}
  \item{dry_end}{Number of consecutive days at end of season with less
  than \code{rain_cutoff} of measured rain; if last day of season had
  rainfall greater than or equal to \code{rain_cutoff}, the returned value
  will be zero}
  \item{mean_period_total_season}{Mean total seasonal rainfall across all
  seasons}
  \item{sd_period_total_season}{Standard deviation of total rainfall across
  all seasons}
  \item{mean_period_norain}{Mean number of days with rainfall less than
  \code{rain_cutoff} across all seasons}
  \item{sd_period_norain}{Standard deviation of number of days with rainfall
  less than \code{rain_cutoff} across all seasons}
  \item{mean_period_raindays}{Mean number of days with rainfall greater than
  or equal to \code{rain_cutoff} across all seasons}
  \item{sd_period_norain}{Standard deviation of number of days with rainfall
  greater than or equal to \code{rain_cutoff} across all seasons}
  \item{mean_period_percent_raindays}{Mean percentage of days in season with
  rain greater than or equal to \code{rain_cutoff} across all seasons}
  \item{sd_period_percent_raindays}{Standard deviation of percentage of days
  in season with rain greater than or equal to \code{rain_cutoff} across all
  seasons}
  \item{dev_total_season}{Amount by which season total rainfall deviates from
  the mean total rainfall across seasons}
  \item{z_total_season}{Difference of total seasonal rainfall and mean of
  total rainfall across seasons, divided by \code{sd_period_total_season}}
  \item{dev_raindays}{Difference in number of days with rainfall greater than
  or equal to \code{rain_cutoff} from the mean number of days with rainfall
  greater than or equal to \code{rain_cutoff} across seasons}
  \item{dev_norain}{Difference in number of days with rainfall less than
  \code{rain_cutoff} from the mean number of days with rainfall less than
  \code{rain_cutoff} across seasons}
  \item{dev_percent_raindays}{Difference in percentage of days with rainfall
  greater than or equal to \code{rain_cutoff} from the percentage of days
  with rainfall greater than or equal to \code{rain_cutoff} across seasons}
  \item{z_percent_raindays}{Difference in percentage of days with rainfall
  greater than or equal to \code{rain_cutoff} from
  \code{mean_period_percent_raindays}, divided by
  \code{sd_period_percent_raindays}}
}

If \code{wide = TRUE}, all columns except those with *_period_* pattern are
replaced with one column for each year. For example, if the data include
daily measurements from 1997 to 2002, there will be no \code{mean_season}
column in the output, but will instead have columns \code{mean_season_1997},
\code{mean_season_1998}...\code{mean_season_2002}.
}
\description{
Uses daily site data to calculate summary rainfall statistics
for an annual season.
}
\details{
User-defined seasons will be, at most, one year long, defined by the
\code{start_*} and \code{end_*} parameters. Seasons \emph{can} span across
the new year, e.g. a season can start in November and end in March. Seasons
are enumerated by the year in which they start; i.e. if a season starts in
November and ends in March, the output for year YYYY will be based on the
data from November and December of YYYY and January, February, and March of
YYYY + 1.

By default, will return data in "long" format, with a column indicating the
year the data correspond to (but see discussion of season enumeration above).
If \code{wide = TRUE}, output will include a separate column for each
statistic for each year (see \strong{Value}). For example, if \code{wide =
FALSE} and the data include daily measurements from 1997 to 2002, the output
will have a column \code{year} and a column \code{mean_season}. For these
same data, if \code{wide = TRUE}, there will be no \code{year} column, but
instead it will contain columns \code{mean_season_1997},
\code{mean_season_1998}...\code{mean_season_2002}.
}
\examples{
\dontrun{
# Season defined by 15 March through 15 November
rain_summary <- summarize_rainfall(rain = rain_2yr,
                                   start_month = 3,
                                   end_month = 11)

# As example above, but output in "long" format
rain_summary <- summarize_rainfall(rain = rain_2yr,
                                   start_month = 3,
                                   end_month = 11,
                                   wide = FALSE)

# Season defined by 30 November through 15 March
rain_summary <- summarize_rainfall(rain = rain_2yr,
                                   start_month = 11,
                                   end_month = 3,
                                   start_day = 30,
                                   end_day = 15)
}

}
\seealso{
\code{\link{summarize_temperature}}, \code{\link{par_summarize_rainfall}}
}
