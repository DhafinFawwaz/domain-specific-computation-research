#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime taxa collapse \
  --i-table denoised/table.qza \
  --i-taxonomy taxonomy-custom/taxonomy.qza \
  --p-level 6 \
  --o-collapsed-table cross-validation/genus-table.qza \
  --verbose

qiime feature-table relative-frequency \
  --i-table cross-validation/genus-table.qza \
  --o-relative-frequency-table cross-validation/genus-rel-freq-table.qza \
  --verbose

qiime tools export \
  --input-path cross-validation/genus-rel-freq-table.qza \
  --output-path cross-validation/exported-for-ml/

biom convert \
  -i cross-validation/exported-for-ml/feature-table.biom \
  -o cross-validation/feature-table-for-ml.tsv \
  --to-tsv