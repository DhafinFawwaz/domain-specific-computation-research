#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny rooted-tree.qza \
  --i-table denoised/table.qza \
  --p-sampling-depth 100 \
  --m-metadata-file denoised/sample-metadata.tsv \
  --output-dir core-metrics-results