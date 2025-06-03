from Bio.Blast import NCBIWWW, NCBIXML
from Bio import Entrez
import time

Entrez.email = "dhafin.fawwaz@gmail.com"

sequence = "TAAGGAATATTGCGCAATGGGCGACAGCCTGACGCAGCGACGCCGCGTGGGGGATGAAGGTCTTCGGATTGTAAAGCCCTTTTGTTGGGAAAGAAATCCTGTCGATTAATACTCGGTGGGGATGACGGTACCCAAAGAATAAGCACCGGCTAACTTCGTGCCAGCAGCCGCGGTAATACGAAGGGGGCTA"

start_time = time.time()
print("Running BLAST search...")
result_handle = NCBIWWW.qblast("blastn", "rRNA_typestrains/ITS_RefSeq_accessions", sequence, megablast=True)

blast_record = NCBIXML.read(result_handle)
top_hit = blast_record.alignments[0]
accession = top_hit.accession
print(f"Top hit accession: {accession}")

for i in range(min(5, len(blast_record.alignments))):
    alignment = blast_record.alignments[i]
    print(f"Hit {i+1}: {alignment.hit_def} (Score: {alignment.hsps[0].score})")

print("Fetching taxonomy...")
handle = Entrez.efetch(db="nucleotide", id=accession, rettype="gb", retmode="text")
record = handle.read()

import re
match = re.search(r"ORGANISM\s+(.+)", record)
if match:
    organism = match.group(1)
    print(f"Organism: {organism}")
else:
    print("Organism info not found.")

end_time = time.time()
elapsed_time = end_time - start_time
print(f"BLAST search completed in {elapsed_time:.2f} seconds.")


# import time
# import random
# from Bio.Blast import NCBIWWW, NCBIXML
# from Bio import SeqIO
# import pandas as pd

# sequences = list(SeqIO.parse("blast/exported-rep-seqs/sequences.fasta", "fasta"))
# random.seed(42)
# sampled_seqs = random.sample(sequences, 100)

# taxonomy_df = pd.read_csv("blast/exported-taxonomy/taxonomy.tsv", sep="\t", index_col=0)

# def blast_sequence(seq_record):
#     try:
#         result_handle = NCBIWWW.qblast("blastn", "nt", seq_record.seq, hitlist_size=1)
#         blast_record = NCBIXML.read(result_handle)
#         if blast_record.alignments:
#             return blast_record.alignments[0].hit_def
#         else:
#             return "No hits"
#     except Exception as e:
#         return f"Error: {e}"

# results = []

# for i, seq in enumerate(sampled_seqs, 1):
#     print(f"Processing {i}/100: {seq.id}")
#     print(seq.seq)
#     start_time = time.time()
#     blast_hit = blast_sequence(seq)
#     assigned_tax = taxonomy_df.loc[seq.id]["Taxon"] if seq.id in taxonomy_df.index else "Not assigned"
#     res = {
#         "ID": seq.id,
#         "Assigned_Taxonomy": assigned_tax,
#         "BLAST_Top_Hit": blast_hit,
#         "Sequence": str(seq.seq)
#     }
#     results.append(res)
#     print(res)
#     elapsed_time = time.time() - start_time
#     print(f"Processed {i}/100 in {elapsed_time:.2f} seconds")
#     time.sleep(5)

# df = pd.DataFrame(results)
# df.to_csv("taxonomy_blast_comparison.csv", index=False)
# print("Comparison saved to taxonomy_blast_comparison.csv")

