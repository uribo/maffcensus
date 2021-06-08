FROM rocker/geospatial:4.1.0@sha256:5cafe9eb9c6d8d75ada0c2afb7ed3818058ed9a6c962df5077e8d00c462ffd73

RUN set -x && \
  apt-get update && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ARG GITHUB_PAT

RUN set -x && \
  echo "GITHUB_PAT=$GITHUB_PAT" >> /usr/local/lib/R/etc/Renviron
