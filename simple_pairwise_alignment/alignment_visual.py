#!/usr/bin/env python3.11
import sys

def read_fasta(file_path):
    """Reads a FASTA file and returns the sequences w/o headers."""
    sequences = [] # makes a list w the sequences from the file
    with open(file_path, 'r') as file:
        current_sequence = ""
        for line in file:
            line = line.strip()  # Remove whitespace
            if line.startswith('>'): #separate headers from sequences
                if current_sequence: #when a new header is found, save the previous and start loop on new sequence
                    sequences.append(current_sequence)
                    current_sequence = ""
            else:
                current_sequence += line
        if current_sequence:  # Add the last sequence
            sequences.append(current_sequence)
    return sequences #all sequences should be saved without headers

def align_sequences(seq1, seq2):
    """Returns a string with '|' for matches and ' ' for mismatches."""
    alignment = "" #store allignment results
    for base1, base2 in zip(seq1, seq2):
        if base1 == base2:
            alignment += '|'
        else:
            alignment += ' '
    return alignment

if __name__ == "__main__":
    if len(sys.argv) != 2: #can only work when calling on script and 1 FASTA file
        print("Usage: python3.11 <script_name.py> <file.fasta>") #if ^ condition not met
        sys.exit(1)

    fasta_file = sys.argv[1]
    sequences = read_fasta(fasta_file)

    if len(sequences) < 2: #checks for at least 2 sequences 
        print("Error: The script needs at least 2 sequences to compare.")
        sys.exit(1)

    # Compare each sequence with the next one
    for i in range(len(sequences) - 1):
        print(f"\nMatches between Sequence {i + 1} and Sequence {i + 2}:")
        print(sequences[i])
        print(align_sequences(sequences[i], sequences[i + 1]))
        print(sequences[i + 1])
