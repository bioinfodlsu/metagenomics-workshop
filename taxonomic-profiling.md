# Taxonomic Profiling
We begin the exploration of computational workflows by trying to figure out the taxonomic composition of the sampled microbial community, i.e. to find out what species are present and in what proportion. 

There are many tools available for this task. The basic idea behind all of them to assign reads to  sequences in a reference database, and then count the number of reads to compute relative abundance. Broadly speaking, there are two choices for the reference database. 

## Using a database of marker genes known for discriminatory power between species
Metagenomic profilers in this category rely on pre-selected, unique clade-specific marker genes. MetaPhlAn is an example of such a tool. 

## Using comprehensive whole-genome databases
Another approach is to use comprehensive databases containing complete and draft microbial genomes from, e.g. GenBank. Kraken is an example of such a tool.

MetaPhlan ver. 4 and Kraken ver. 2 are available in this Docker container. 
Let us apply MetaPhlAn4 and Kraken2 on our dataset of hospital wastewater of Finland and Benin.

## Discussion
What are the (dis)-advantages of the two approaches above? Are they computing the same thing?

## References and further reading
- Segata et al., [Metagenomic microbial community profiling using unique clade-specific marker genes](https://doi.org/10.1038/nmeth.2066), Nature Methods 9(8):811-814 (2012).
- Wood et al., [Kraken: ultrafast metagenomics sequence classification using exact alignments](https://doi.org/10.1186/gb-2014-15-3-r46), Genome Biology, 15, R46 (2014).
- Ye et al., [Benchmarking Metagenomics Tools for Taxonomic Classification](https://doi.org/10.1016/j.cell.2019.07.010), Cell Volume 178, Issue 4, 779 -- 74 (2019).
- Sun et al., [Challenges in benchmarking metagenomic profilers](https://doi.org/10.1038/s41592-021-01141-3), Nature Methods, 18, 618-626 (2021)
  