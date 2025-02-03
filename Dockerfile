
# Dockerfile for for R base image with INLA installed
# after installation, can be used interactively with:
# sudo docker run --rm -it docker_r_base bash
FROM r-base


RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("dplyr"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("lubridate"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("parallel"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("readxl"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("tidyr"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("devtools"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); library(devtools); devtools::install_github("EcoGRAPH/clusterapply")'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("remotes"), repos=c(getOption("repos"), dep=TRUE))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); library(remotes); remotes::install_github("ecograph/epidemiar@v3.1.1", build = TRUE, build_opts = c("--no-resave-data", "--no-manual"))'
RUN R -e 'r = getOption("repos"); r["CRAN"] = "http://cran.us.r-project.org"; options(repos = r); install.packages(c("tsibble"), repos=c(getOption("repos"), dep=TRUE))'



