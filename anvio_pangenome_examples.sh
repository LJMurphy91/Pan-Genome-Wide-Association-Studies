#!/bin/bash

set -e

# this script,
#   1. contains steps in the next section to perform a pangenomic analysis
#      using anvio as detailed in http://merenlab.org/2015/11/14/pangenomics/
#   2. contains commands to re-run the examples in the previous post if you
#      have downloaded the data linked from that post.

# here are the project specific steps:
#
# a. obtain GenBank files (or generate them yourself).
# b. use ITEP, or any other tool, to generate your protein clusters.
# c. create your `data.txt` where you have counts for your protein
#    clusters across genomes (if you used ITEP and not sure how to generate
#    your `data.txt` file from it, see the relevant section in the anvi'o
#    pangenomics blog post to employ `anvi-script-itep-to-data-txt` script).
# d. create your `tree.newick` from your `data.txt`. you can use this command:
#             anvi-matrix-to-newick data.txt -o tree.newick
# e. create your `tree-for-samples-order.txt`. you can use this command:
#             anvi-matrix-to-newick data.txt -o tree-for-samples-order.txt --transpose
# f. create your `samples-order.txt` from `o tree-for-samples-order.txt`. this post
#    describes the file and newick entry format:
#             http://merenlab.org/2015/11/10/samples-db/#the-samples-order-file-format
# g. create your `samples-information.txt` to describe the contextual
#    data you have for your genomes. this opst describes the file format:
#             http://merenlab.org/2015/11/10/samples-db/#the-samples-information-file-format


# Once you are done with project specific steps (or if you are in a relevant directory
# within our figshare publication), run these commands:

# (Re-)create the samples database:
rm -rf SAMPLES.db
anvi-gen-samples-info-database -D samples-information.txt -R samples-order.txt -o SAMPLES.db

# create a mock FASTA file:
for i in `awk '{if(NR > 1) print $1}' data.txt`; do echo ">$i"; echo "ATCG"; done > fasta.fa

# run the interactive interface:
anvi-interactive -f fasta.fa -p PROFILE.db -d data.txt -t tree.newick -s SAMPLES.db --state saved_state --manual