#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime diversity pcoa \
  --i-distance-matrix core-metrics-results/weighted_unifrac_distance_matrix.qza \
  --o-pcoa core-metrics-results/weighted_unifrac_pcoa_results.qza

qiime emperor plot \
  --i-pcoa core-metrics-results/weighted_unifrac_pcoa_results.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization core-metrics-results/weighted_unifrac_emperor.qzv

qiime emperor plot \
  --i-pcoa core-metrics-results/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization core-metrics-results/unweighted_unifrac_emperor.qzv

qiime emperor plot \
  --i-pcoa core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization core-metrics-results/bray_curtis_emperor.qzv

qiime emperor plot \
  --i-pcoa core-metrics-results/jaccard_pcoa_results.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization core-metrics-results/jaccard_emperor.qzv