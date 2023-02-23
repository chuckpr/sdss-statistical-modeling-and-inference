FROM jupyter/r-notebook:python-3.10.9

RUN mamba install -y r-tidymodels
