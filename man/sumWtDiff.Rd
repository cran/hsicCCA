\name{sumWtDiff}
\alias{sumWtDiff}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sum of Weighted Pairwise Outer Differences.
}
\description{
Given weights matrix Wt, find sum of weighted pairwise outer product of differences, i.e. sum_{i,j} Wt_{ij}(x_i-x_j)(x_i-x_j)^T. Internal use only.
}
\usage{
sumWtDiff(Wt, x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Wt}{
Weight matrix, nrow(x)-by-nrow(x)
}
  \item{x}{
data matrix, one observation per row.
}
}

\value{
the weighted sum of outer product of pairwise differences.
}

\author{
Billy Chang
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
