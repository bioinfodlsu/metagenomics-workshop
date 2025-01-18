# Data analysis overview
The raw input data is in the form of short sequences of length around 100 bp.
Prior to the actual data analyis, it is generally advised to clean and trim the reads, but these are rather mechanical, fairly easy to do, and not really interesting. We will skip ahead to the more interesting parts of the analysis workflow.

The workflow, of course,  depends on the research objectives. Some of the typical questions that researchers try to answer are:

1. What are the different species of bacteria that are present in the sample?
2. In what relative abundance are they present?
3. Are there differences in the bacterial community profiles among sites ?
4. What kind of antibiotic resistant genes are present? In what proportion?
5. What kind of mobile genetic elements are present? In what proportion?
 

## Assembly-based approach
One approach is to first **assemble** the reads, which means to stitch the reads together to reconstruct the chromosome which was fragmented during the sequencing process.
This is a challenging task and is computationally demanding. 
We will not delve into this approach in this workshop.


## Assembly-free
What we will explore is the assembly-free approach, in which the reads are compared against reference databases to answer the questions posed above. In particular, we will look at Questions 1 -- 3.

