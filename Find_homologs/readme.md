# This script was made to find homologous proteins using tblastn 
we aimed to find sequences with >30% sequence identity 90% match length per the assignment, but this can be adjusted for different requirements in different circumstances)
Our query file is the protein sequence for an organism of your choice against the sequence of a protein from a database - in this class we compared 4 different organsism to the sequence for the histidine kinase domain, but again this can be used for any protein sequence comparisons to find the number of homologs 
```
./find_homologs.sh query.faa subject_db output.txt
```

