% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SampleDist.R
\name{sampleToSample}
\alias{sampleToSample}
\title{sampleToSample my awesome function #2}
\usage{
sampleToSample(data, samples = NULL)
}
\arguments{
\item{data:}{normalized deseq data (with varianceStablizing, rlog etc)}

\item{samples:}{vector of sample names to show in map}
}
\description{
Plots heatmap showing sample-to-sample distances
}
\examples{
vst <- varianceStabilizingTransformation(dds)
sampleToSample(data = vst)
}
