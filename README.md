# Pan-Genome-Wide-Association-Studies

Protocol used to perform Pan Genome-Wide Association Studies of <i> Mycobacterium canettii </i> strains and <i> Mycobacterium tuberculosis </i> H37Rv

ANVI'O WAS USED TO VISUALISE CORE / PAN GENOME RESULTS

<u><b> METHODS: </u></b><br>

Step 1. Generate the MTB / STB core and pan genomes using ROARY - need genome files in GFF or GFF3 format<br>
Step 2. Generate a traits.csv file containing your traits of interest<br>
        --> the first column must contain the exact strain names, the header must consist of your traits and 1s and 0s denote if strains               have that specific trait<br>
Step 3. Run Scoary using traits.csv and genes_presence_absence.csv<br>
Step 4. Filter the scoary output to contain only genes that are 100% specific and sensitive to your traits, and are in all strains.<br>
Step 5. Convert genes_presence_absence.Rtab to ANVI'O data.txt format<br>
        --> remove the first column containing gene names and replace with numbers in increments of 1<br>
Step 6. Generate the ANVI'O required files samples-order.txt and samples-information.txt. <br>
        --> samples-order.txt contains a transposed tree of the presence / absence of proteins<br>
        --> samples-information.txt contains meta-data of your strains e.g. % GC content, number of genes etc.<br>
Step 7. Run ANVI'O and manually select your segments of interest e.g. core genome<br>
