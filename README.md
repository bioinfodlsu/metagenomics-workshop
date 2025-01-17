This repository contains material for an introductory workhsop on metagenomics.

It is a collection of Jupyter notebooks and markdown files, which can be run independently and also compiled using jupyter-book into an html book. 

Currently, the book is hosted [here](https://bioinfodlsu.com/metagenomics-workshop).

To build locally:

First, install jupyter-book, e.g. via conda:
```
conda install -c conda-forge jupyter-book
```

and with the conda environment activated, in the top directory, run: 
```
jupyter-book build .
```
The html pages can be found inside `_build`, and
the home page for the book can be found at `_build/html/index.html`.

All software dependencies are encapsulated in the Docker container that can be downloaded from the Github Packages link associated with this repository. See Getting Started for more information.