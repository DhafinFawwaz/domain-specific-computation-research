#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime feature-classifier classify-sklearn \
  --i-classifier silva-138-99-nb-classifier.qza \
  --i-reads denoised/rep-seqs.qza \
  --o-classification taxonomy/taxonomy.qza

qiime taxa barplot \
  --i-table denoised/table.qza \
  --i-taxonomy taxonomy/taxonomy.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization taxonomy/taxa-bar-plots.qzv