#Place all .gff files in one directory
#run using screen -L bash roary.sh
#include the number of threads and blastp cut off

roary -p <number of threads> -e -n -i <blastp cut off> -r *.gff 
