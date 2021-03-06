% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getSign.R
\name{getSignName}
\alias{getSignName}
\title{getSign IDs of genes that are sign. up or down}
\usage{
getSignName(x, p, l = 0)
}
\arguments{
\item{x:}{object of results(dds)}

\item{p:}{p-adj cutoff to use}

\item{l:}{log2(fc) cutoff to use}
}
\description{
Get the significantly changed genes, returning IDs of up and down-regulated genes separately in a list.
}
\examples{
test <- results(dds,contrast = c("condition","genex-KO","WT"))
sign <- getSign(x = test, p = 0.01, l = 0.5)
up <- sign$up
down <- sign$down

}
