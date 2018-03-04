#Visualizing the Core/Pangenome using the MAC version of ANVI'O version X
#Download ANVI'O
#Run ANVI'O in the terminal

source/Applications/Anvio.app/Contents/Resources/Scripts/activate.sh

#1. Convert the ROARY gene_presence_absence.Rtab to the ANVI'O file format
#Remove the row names and replace with the row number

awk '{$1 = NR; print}' OFS="\t" gene_presence_absence.Rtab > data.txt

#2. Generate the ANVI'O required files
#Convert the data matrix to a tree of the presence and absence of protein 

anvi-matrix-to-newickdata.txt -o tree.newick

#Convert the matrix to a transposed tree
anvi-matrix-to-newick data.txt -o tree-for-samples-order.txt –transpose

#Generate the samples-order.txt, by copying the tree from the tree-for-samples-order.txt file (follow sample file given)
#Generate the samples-information.txt (follow sample file given)

#3. Run ANVI'O using the given bash script

./anvio_pangenome_examples.sh
