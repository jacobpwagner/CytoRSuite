% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gatingTemplate-modifiers.R
\name{gate_remove}
\alias{gate_remove}
\title{Remove Gate(s) and Edit gatingTemplate csv File}
\usage{
gate_remove(gs, alias = NULL, gatingTemplate = NULL)
}
\arguments{
\item{gs}{an object of class \code{GatingSet}.}

\item{alias}{name(s) of the population(s) to remove (e.g. "Single Cells"). By
default all descendant populations will be removed as well.}

\item{gatingTemplate}{name of the \code{gatingTemplate} csv file (e.g.
"gatingTemplate.csv").}
}
\value{
an object of class \code{gatingSet} with gate and children removed,
  as well as gatingTemplate file with population removed.
}
\description{
Remove Gate(s) and Edit gatingTemplate csv File
}
\examples{
\dontrun{
library(CytoRSuiteData)

# Load in samples
fs <- Activation
gs <- GatingSet(fs)

# Apply compensation
gs <- compensate(gs, fs[[1]]@description$SPILL)

# Transform fluorescent channels
trans <- estimateLogicle(gs[[4]], cyto_fluor_channels(gs))
gs <- transform(gs, trans)

# Gate using gate_draw
gt <- Activation_gatingTemplate
gating(gt, gs)

# Remove T Cells population - replace gatingTemplate name
gate_remove(gs, "T Cells", gatingTemplate = "gatingTemplate.csv")
}
}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
