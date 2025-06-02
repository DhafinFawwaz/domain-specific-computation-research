#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime dada2 denoise-single \
  --i-demultiplexed-seqs filtered/demux-filtered.qza \
  --p-trim-left 0 --p-trunc-len 150 \
  --o-representative-sequences plot/rep-seqs.qza \
  --o-table plot/feature-table.qza \
  --o-denoising-stats plot/denoising-stats.qza

# qiime feature-classifier classify-sklearn \
#   --i-classifier silva-138-99-nb-classifier.qza \
#   --i-reads plot/rep-seqs.qza \
#   --o-classification plot/taxonomy.qza

# qiime taxa barplot \
#   --i-table plot/feature-table.qza \
#   --i-taxonomy plot/taxonomy.qza \
#   --m-metadata-file sample-metadata.tsv \
#   --o-visualization plot/dominant_taxonomy_barplot.qzv
