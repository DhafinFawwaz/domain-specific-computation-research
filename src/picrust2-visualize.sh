#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime feature-table summarize \
  --i-table picrust2/pathway_abundance.qza \
  --o-visualization picrust2/pathway_abundance_summary.qzv \
  --m-sample-metadata-file denoised/sample-metadata.tsv

qiime feature-table barplot \
  --i-table picrust2/pathway_abundance.qza \
  --m-sample-metadata-file denoised/sample-metadata.tsv \
  --p-category sample-name
  --o-visualization picrust2/pathway_barplot.qzv
