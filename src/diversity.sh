#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime feature-table rarefy \
  --i-table denoised/table.qza \
  --p-sampling-depth 30000 \
  --o-rarefied-table diversity/core-metrics-results/rarefied_table.qza

qiime diversity alpha \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --p-metric shannon \
  --o-alpha-diversity diversity/core-metrics-results/shannon_vector.qza

qiime diversity alpha \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --p-metric observed_features \
  --o-alpha-diversity diversity/core-metrics-results/observed_features_vector.qza

qiime diversity alpha-phylogenetic \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --i-phylogeny phylogeny/rooted-tree.qza \
  --p-metric faith_pd \
  --o-alpha-diversity diversity/core-metrics-results/faith_pd_vector.qza

qiime diversity beta \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --p-metric braycurtis \
  --o-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza

qiime diversity beta \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --p-metric jaccard \
  --o-distance-matrix diversity/core-metrics-results/jaccard_distance_matrix.qza

qiime diversity beta-phylogenetic \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --i-phylogeny phylogeny/rooted-tree.qza \
  --p-metric unweighted_unifrac \
  --o-distance-matrix diversity/core-metrics-results/unweighted_unifrac_distance_matrix.qza

qiime diversity beta-phylogenetic \
  --i-table diversity/core-metrics-results/rarefied_table.qza \
  --i-phylogeny phylogeny/rooted-tree.qza \
  --p-metric weighted_unifrac \
  --o-distance-matrix diversity/core-metrics-results/weighted_unifrac_distance_matrix.qza

qiime diversity pcoa \
  --i-distance-matrix diversity/core-metrics-results/bray_curtis_distance_matrix.qza \
  --o-pcoa diversity/core-metrics-results/bray_curtis_pcoa_results.qza

qiime diversity pcoa \
  --i-distance-matrix diversity/core-metrics-results/unweighted_unifrac_distance_matrix.qza \
  --o-pcoa diversity/core-metrics-results/unweighted_unifrac_pcoa_results.qza

qiime diversity pcoa \
  --i-distance-matrix diversity/core-metrics-results/weighted_unifrac_distance_matrix.qza \
  --o-pcoa diversity/core-metrics-results/weighted_unifrac_pcoa_results.qza

qiime diversity pcoa \
  --i-distance-matrix diversity/core-metrics-results/jaccard_distance_matrix.qza \
  --o-pcoa diversity/core-metrics-results/jaccard_pcoa_results.qza