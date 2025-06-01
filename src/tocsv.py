from Bio import SeqIO
import os
import csv

with open("dataset.csv", "w", newline="") as csvfile:
    fieldnames = ["id", "description", "seq"]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    for root, dirs, files in os.walk("extract"):
        for file in files:
            if file.endswith(".fasta"):
                print("Reading file", file)
                for record in SeqIO.parse("extract/"+file, "fasta"):
                    writer.writerow({"id": record.id, "description": record.description, "seq": str(record.seq)})
