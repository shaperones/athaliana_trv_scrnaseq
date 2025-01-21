FROM gcfntnu/scanpy:1.10.3

SHELL ["/bin/bash", "-c"]
WORKDIR /usr/src/app


RUN conda install anndata2ri=1.1 \
    && conda install -c conda-forge pkg-config

RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base && \
    R -e "options(repos='https://cran.rstudio.com'); \
        install.packages('SoupX'); \
        BiocManager::install(c('scater','scDblFinder','scry','scran'));"


EXPOSE 8888
CMD ["/bin/bash"]
