# 🧬 Find Homologous Genes Containing the Histidine Kinase Domain
- This script is a continuation of the original find_homologous script and identifies genes that contain homologous histidine kinase (HK) domains by combining BLAST search results with gene coordinate information from a BED file.
- It filters BLAST hits for >30% sequence identity and >90% query coverage, then determines which annotated genes those hits fall within.
  
⚖️ How This Script Differs from the Basic Version
- Unlike the simpler BLAST filtering script (which only reported high-identity hits),this version maps those hits back to genomic features using a BED file.

This allows you to:
- Identify which specific genes in the genome contain a homologous domain.
- Relate domain-level homology to gene-level annotations — crucial for functional genomics analysis.
In short:
🧩 The first script finds/counts homologous sequences.
🧬 This script finds which genes those sequences belong to.

This assignment was from week 4 of the semester and again the parameters can be adjusted based on need 

```
find_homologs_and_genes.sh <query.faa> <subject.fna> <bedfile> <outfile>
```
