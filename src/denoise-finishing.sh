#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime feature-table tabulate-seqs \
  --i-data denoised/rep-seqs.qza \
  --o-visualization denoised/rep-seqs.qzv

qiime metadata tabulate \
  --m-input-file denoised/denoising-stats.qza \
  --o-visualization denoised/denoising-stats.qzv

qiime feature-table summarize \
  --i-table denoised/table.qza \
  --o-visualization denoised/table.qzv \
  --m-sample-metadata-file denoised/sample-metadata.tsv