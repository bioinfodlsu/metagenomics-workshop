# Metagenomics Workshop
This is a Jupyter book contains material for the workshop titled "The Bioinformatics of Profiling Microbial Communities in Wastewater from Shotgun Metagenome Samples" (to be) conducted at [IWOMB 2025](https://sites.google.com/up.edu.ph/iwomb2025/home?authuser=0).

# Building HTML

You need `Jupyter Book`. Get it, e.g. via conda:
```
conda create -n jbook python=3.12
conda activate jbook
conda install -c conda-forge jupyter-book
```

To build the book's HTML, from inside the top directory of this repository:
```
jupyter-book build .
```
This will produce a `_build` folder, inside which is the entrypoint `index.html`.

# Without building HTML
Alternatively, you can open the entire directory on Jupyter Lab and work on individual `.ipnyb` notebooks or `.md` markup files.
