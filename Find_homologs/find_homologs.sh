queryfile="$1"
subjectfile="$2"
outputfile="$3"
# defining variables 
tblastn -query "$queryfile" -db "$subjectfile" -outfmt "6 sseqid pident length qlen slen" | \
awk -F'\t' '$2 > 30 && $3 > 0.9 * $4' > "$outputfile"
# filter results
perfect_match=$(wc -l < "$outputfile")
echo number of perfect matches: $perfect_match
#print number of matches 
