#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

mkdir -p qiime2_output/visualizations

echo "Creating manifest.tsv for importing data into QIIME2..."
echo -e "sample-id\tabsolute-filepath\tdirection" > manifest.tsv
for i in {895..896}; do
    echo -e "SRR32507${i}\t$(pwd)/extract/SRR32507${i}.fastq\tforward" >> manifest.tsv
done

echo "Importing data into QIIME2..."

qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path manifest.tsv \
  --output-path qiime2_output/demux-seqs.qza \
  --input-format SingleEndFastqManifestPhred33V2

echo "Summarize and visualize imported data.."
qiime demux summarize \
  --i-data qiime2_output/demux-seqs.qza \
  --o-visualization qiime2_output/visualizations/demux-seqs.qzv

echo "Imported data and created quality visualization."
echo "Please examine the quality plots at qiime2_output/visualizations/demux-seqs.qzv"
echo "Then adjust the trim and truncation parameters in the next step based on quality profiles."
echo "To proceed with denoising, run: bash process_part2.sh"