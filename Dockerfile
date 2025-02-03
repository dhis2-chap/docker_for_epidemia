
# Dockerfile for for R base image with INLA installed
# after installation, can be used interactively with:
# sudo docker run --rm -it docker_r_base bash
#FROM r-base:4.3.1

FROM rocker/r-ver:4.3.1

RUN apt-get update && \
  apt-get install -y libcurl4-openssl-dev libssl-dev libssh2-1-dev libxml2-dev zlib1g-dev && \
  R -e "install.packages(c('devtools', 'testthat', 'roxygen2'))"

RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("dplyr"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("lubridate"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("parallel"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("readxl"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("tidyr"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); library(devtools); devtools::install_github("EcoGRAPH/clusterapply")'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("remotes"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); library(remotes); remotes::install_github("ecograph/epidemiar@v3.1.1", build = TRUE, build_opts = c("--no-resave-data", "--no-manual"))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("tsibble"), repos=c(getOption("repos"), dep=TRUE))'



