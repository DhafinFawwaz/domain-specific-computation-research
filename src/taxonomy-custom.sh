#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

# qiime feature-classifier extract-reads \
#   --i-sequences silva-138-99-seqs.qza \
#   --p-f-primer CCTACGGGRSGCAGCAG \
#   --p-r-primer TTTCAGYCTTGCGRCCGTAC \
#   --p-trunc-len 0 \
#   --o-reads silva-138-99-341F-909R-extracted.qza \
#   --verbose

qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads silva-138-99-341F-909R-extracted.qza \
  --i-reference-taxonomy silva-138-99-tax.qza \
  --o-classifier silva-138-99-341F-909R-classifier.qza \
  --verbose

qiime feature-classifier classify-sklearn \
  --i-classifier silva-138-99-341F-909R-classifier.qza \
  --i-reads denoised/rep-seqs.qza \
  --o-classification taxonomy-custom/taxonomy.qza \
  --verbose

qiime metadata tabulate \
  --m-input-file taxonomy-custom/taxonomy.qza \
  --o-visualization taxonomy-custom/taxonomy.qzv \
  --verbose
