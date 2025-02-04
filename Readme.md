
# Docker image for the epidemiar model

In .github/workflows/build.yml we assign the image names, like IMAGE_NAME: "dhis2-chap/docker_for_epidemia". And the rest is the same as in the template from docker_r_termplate.

In the Dockerfile we create the docker image. We base the image on the existing rocker image for R version 4.3.1. Then we install some libraries for handling libraries in a docker image, this is shown below.

```
FROM rocker/r-ver:4.3.1

RUN apt-get update && \
  apt-get install -y libcurl4-openssl-dev libssl-dev libssh2-1-dev libxml2-dev zlib1g-dev && \
  R -e "install.packages(c('devtools', 'testthat', 'roxygen2'))"
```
After this we simply install the necessary R packages, and for some of them we include a library, for instance devtools, because some of the packages are not available on CRAN.

As mentioned in the tutorial at docker_r_template, it is important to verify that the resulting package is public, which can be verified by running `docker pull ghcr.io/ORGANIZATION/IMAGE_NAME:master`, or in this case `docker pull ghcr.io/dhis2.chap/docker_for_epidemia:master`.

