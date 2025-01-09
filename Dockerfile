FROM jupyter/scipy-notebook:latest

# Use root to install and manage dependencies
USER root

RUN mkdir -p /data /notebooks /results
# Install required dependencies
RUN apt-get update && apt-get -y --no-install-recommends install \
    wget \
    ca-certificates \
    zlib1g-dev \
    make \
    g++ \
    gfortran \
    rsync \
    python3 \
    python3-pip \
    r-base \
    libcurl4-openssl-dev \
    libxml2-dev \
    libssl-dev \
    libgit2-dev \
    libpcre2-dev \
    liblzma-dev \
    libbz2-dev \
    libxt-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    libopenblas-dev \
    libarmadillo-dev \
    libgsl-dev \
    fontconfig \
    && rm -rf /var/lib/apt/lists/* && apt-get clean


# Install cpanm (CPAN Minus) tool
RUN curl -L https://cpanmin.us | perl - App::cpanminus

# Install Perl module required for Kraken2
RUN cpanm Getopt::Std

# Install R and the IRkernel for Jupyter
RUN R -e "install.packages(c('IRkernel', 'ggplot2', 'tidyr', 'stringr', 'plotly', 'ggfortify', 'ggrepel', 'reshape2', 'patchwork', 'ggsignif', 'lattice', 'permute', 'vegan', 'compositions'))" && \
    R -e "IRkernel::installspec(user = FALSE)"

RUN R -e "install.packages('tidyverse', dependencies = TRUE)"


# Download, unpack, and install Kraken2
RUN wget https://github.com/DerrickWood/kraken2/archive/v2.1.2.tar.gz && \
    tar -xzf v2.1.2.tar.gz && \
    rm -rf v2.1.2.tar.gz && \
    cd kraken2-2.1.2 && \
    ./install_kraken2.sh /home/jovyan/kraken2-2.1.2 && \
    mkdir -p /home/jovyan/kraken2-db

# Add Kraken2 to PATH
ENV PATH="/home/jovyan/kraken2-2.1.2:$PATH" \
    LC_ALL=C

# Install specific versions of Samtools and Bowtie2 via Conda
RUN conda install -y -c bioconda \
    bowtie2 \
    samtools && \
    conda clean -a -y

# Install MetaPhlAn 4 and Bowtie2 using Conda from the Bioconda channel
RUN conda install -c bioconda metaphlan=4.0.0

# Create a directory for the MetaPhlAn database
RUN mkdir -p /home/jovyan/metaphlan

# Create a directory for ResFinder database
RUN mkdir -p /home/jovyan//resfinder_db

# Install BLAST 2.15.0
RUN wget https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.15.0/ncbi-blast-2.15.0+-x64-linux.tar.gz && \
    tar -xzf ncbi-blast-2.15.0+-x64-linux.tar.gz && \
    rm -rf ncbi-blast-2.15.0+-x64-linux.tar.gz && \
    mv ncbi-blast-2.15.0+ /usr/local/ncbi-blast-2.15.0+ && \
    ln -s /usr/local/ncbi-blast-2.15.0+/bin/* /usr/local/bin/

# Add BLAST 2.15.0 to PATH
ENV PATH="/usr/local/ncbi-blast-2.15.0+/bin:$PATH"

RUN apt-get update && apt-get install -y hmmer && \
    rm -rf /var/lib/apt/lists/*

# Install Metaxa 2.2.3
RUN wget https://microbiology.se/sw/Metaxa2_2.2.3.tar.gz && \
    tar -xzf Metaxa2_2.2.3.tar.gz && \
    rm -rf Metaxa2_2.3.tar.gz && \
    cd Metaxa2_2.2.3 && \
    chmod +x ./install_metaxa2 && \
    ./install_metaxa2 && \
    ln -s /home/jovyan/bin/Metaxa2_2.2.3 /usr/local/bin/Metaxa2_2.2.3

# Add Metaxa 2.2.3 to PATH
ENV PATH="/home/jovyan/bin:$PATH"

RUN wget https://github.com/jenniferlu717/Bracken/archive/refs/tags/v2.8.tar.gz && \
    tar -xzf v2.8.tar.gz && \
    rm -rf v2.8.tar.gz && \
    cd Bracken-2.8 && \
    chmod +x install_bracken.sh && \
    ./install_bracken.sh /home/jovyan/Bracken-2.8

# Add Bracken to PATH
ENV PATH="/home/jovyan/Bracken-2.8:$PATH" \
    LC_ALL=C

# Install kreport2mpa.py
RUN wget -O /home/jovyan/kreport2mpa.py https://raw.githubusercontent.com/jenniferlu717/KrakenTools/refs/heads/master/kreport2mpa.py && \
    chmod +x /home/jovyan/kreport2mpa.py

RUN wget -O /home/jovyan/merge_metaphlan_tables.py https://raw.githubusercontent.com/biobakery/MetaPhlAn2/refs/heads/master/utils/merge_metaphlan_tables.py && \
    chmod +x /home/jovyan/merge_metaphlan_tables.py

# Add kreport2mpa.py to PATH
ENV PATH="/home/jovyan:$PATH"

# Expose the Jupyter notebook port
EXPOSE 8888

# Start Jupyter notebook server
CMD ["start-notebook.sh", "--ip", "0.0.0.0", "--allow-root"]
