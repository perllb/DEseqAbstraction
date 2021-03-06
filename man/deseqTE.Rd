% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/deseqTE.R6.R
\docType{class}
\name{deseqTE}
\alias{deseqTE}
\title{Class a simple interface to deseq with transposons - inherits from deseqAbstraction}
\format{\code{\link{R6Class}} object.}
\usage{
deseqTE
}
\value{
Object of \code{\link{R6Class}} to store Deseq data.
}
\description{
Class a simple interface to deseq with transposons - inherits from deseqAbstraction
}
\section{Fields}{

\describe{
\item{\code{name}}{the name of the experiment}

\item{\code{filename}}{the name of the raw featurecount output}

\item{\code{rawfile}}{the raw featurecount file}

\item{\code{rawCounts}}{the count matrix (removing position and length info column 1-6) with ID rownames}

\item{\code{baseMean}}{list of data.frames: Mean and SD: mean and SD of normalized count data}

\item{\code{rpkmMean}}{list of data.frames: Mean and SD: mean and SD of RPKM}

\item{\code{geneID}}{geneIDs}

\item{\code{colData}}{a data.frame with condition information}

\item{\code{sampleNames}}{a vector given by user to provide suitable sampleNames to replace filenames from featureCounts}

\item{\code{VST}}{the output from varianceStabilizingTransformation(dds)}

\item{\code{deseq}}{the output from DESeq(dds)}

\item{\code{rpkm}}{matrix with rpkm values for all genes}

\item{\code{test}}{output from diffex analysis results(dds)}

\item{\code{pos}}{position data for each gene}

\item{\code{length}}{of each gene}
}}

\examples{
dnmt <- deseqAbs$new("DNMT1KO",fc.file)
dnmt$filename
head(dnmt$rawfile)
head(dnmt$pos)
head(dnmt$length)
head(dnmt$rawCounts)
## sampleNames
dnmt$sampleNames <- colnames(dnmt$rawCounts)
## define coldata conditions
dnmt$colData <- data.frame(condition=c(rep("CTR",3),rep("KO",3)))
dnmt$makeDESeq()
dnmt$deseq
dnmt$makeDiffex()
dnmt$test
dnmt$makeVST()
dnmt$makeRPKM()
}
\keyword{Deseq}
