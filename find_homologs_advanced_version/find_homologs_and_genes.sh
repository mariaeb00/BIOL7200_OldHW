# file imputs
queryfile="$1"
subjectfile="$2"
subjectbed="$3"
outputfile="$4"
organism_name="$5"

#Identifying organism from file name
organism_name=$(basename "$subjectfile" | sed 's/_subject\.fna//')

# Run tblastn and filter results
tblastn -query "$queryfile" -subject "$subjectfile" -outfmt "6 sseqid pident length qlen slen sstart send" | \
awk -F'\t' '$2 > 30 && $3 > 0.9 * $4' > "$outputfile"

# Create a temporary file
temp_file='genes_w_hk_domain.txt'
> "$temp_file"

# Identify homologous domains in BED file and write to temp file
while read -r sseqid pident length qlen slen sstart send; do
    while read -r chrom start end gene_name strand; do
        # Check forward strand (5' to 3')
        if [[ "$sseqid" == "$chrom" && "$sstart" -ge "$start" && "$send" -le "$end" ]]; then
            echo "$gene_name" >> "$temp_file"
        # Check reverse strand (3' to 5')
        elif [[ "$sseqid" == "$chrom" && "$sstart" -le "$end" && "$send" -ge "$start" ]]; then
            echo "$gene_name" >> "$temp_file"
        fi
    done < "$subjectbed"  # Updated variable name
done < "$outputfile"

# Print only unique gene names
echo "Unique genes containing homologous histidine kinase domains:"
sort "$temp_file" | uniq

# Print the number of unique genes identified for the organism
unique_genes=$(sort "$temp_file" | uniq | wc -l)
echo "Number of unique genes identified for $organism_name: $unique_genes"

# Print the number of perfect matches
perfect_match=$(wc -l < "$outputfile")
echo "Number of perfect matches: $perfect_match"
