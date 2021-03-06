% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getVariableGenes.R
\name{getVariableGenes}
\alias{getVariableGenes}
\title{getVariableGenes - get genes with high variation}
\usage{
getVariableGenes(data, ntop = 100, sdcut = 0)
}
\arguments{
\item{data:}{normalized deseq matrix data (with varianceStablizing, rlog etc - eg. assay(vsd)}

\item{ntop:}{how many genes to display (the <ntop> most variable genes)}

\item{sdcut:}{return all genes having higher sd than this cutoff}
}
\description{
returns the most variable genes in data
}
\examples{
vst <- varianceStabilizingTransformation(dds)
getVariableGenes(data = assay(vst),ntop = 100)
}
