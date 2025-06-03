#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime diversity alpha-group-significance \
  --i-alpha-diversity diversity/core-metrics-results/shannon_vector.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/shannon-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity diversity/core-metrics-results/observed_features_vector.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/observed_features-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity diversity/core-metrics-results/faith_pd_vector.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/faith_pd-group-significance.qzv


qiime emperor plot \
  --i-pcoa diversity/core-metrics-results/bray_curtis_pcoa_results.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/bray_curtis-emperor.qzv

qiime emperor plot \
  --i-pcoa diversity/core-metrics-results/unweighted_unifrac_pcoa_results.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/unweighted_unifrac-emperor.qzv

qiime emperor plot \
  --i-pcoa diversity/core-metrics-results/weighted_unifrac_pcoa_results.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --o-visualization diversity/weighted_unifrac-emperor.qzv

qiime emperor plot \
  --i-pcoa diversity/core-metrics-results/jaccard_pcoa_results.qza \
  --m-metadata-file denoised/sample-metadata.tsv \
  --o-visualization diversity/jaccard-emperor.qzv

# group by sample-name
qiime diversity beta-group-significance \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --m-metadata-column sample-name \
  --o-visualization diversity/bray_curtis-significance.qzv
qiime diversity adonis \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --p-formula "sample-name" \
  --o-visualization diversity/bray_curtis-adonis.qzv

# group by biosample
qiime diversity beta-group-significance \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --m-metadata-column biosample \
  --o-visualization diversity/bray_curtis-significance.qzv
qiime diversity adonis \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --p-formula "biosample" \
  --o-visualization diversity/bray_curtis-adonis.qzv

# group by library-name
qiime diversity beta-group-significance \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --m-metadata-column library-name \
  --o-visualization diversity/bray_curtis-significance.qzv
qiime diversity adonis \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file diversity/sample-metadata-grouped.tsv \
  --p-formula "library-name" \
  --o-visualization diversity/bray_curtis-adonis.qzv