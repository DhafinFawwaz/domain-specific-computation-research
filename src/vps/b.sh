#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

# Activate the QIIME2 environment
conda activate qiime2-amplicon-2024.10

bash a.sh

qiime deblur denoise-16S \
  --i-demultiplexed-seqs qiime2_output/demux-seqs.qza \
  --p-trim-length 100 \
  --o-representative-sequences qiime2_output/rep-seqs-deblur.qza \
  --o-table qiime2_output/table-deblur.qza \
  --o-stats qiime2_output/deblur-stats.qza \
  --p-jobs-to-start 4 \
  --verbose

qiime feature-table summarize \
  --i-table qiime2_output/table-deblur.qza \
  --o-visualization qiime2_output/visualizations/table-deblur.qzv

qiime feature-table tabulate-seqs \
  --i-data qiime2_output/rep-seqs-deblur.qza \
  --o-visualization qiime2_output/visualizations/rep-seqs-deblur.qzv

qiime deblur visualize-stats \
  --i-deblur-stats qiime2_output/deblur-stats.qza \
  --o-visualization qiime2_output/visualizations/stats-deblur.qzv

qiime vsearch uchime-denovo \
  --i-table qiime2_output/table-deblur.qza \
  --i-sequences qiime2_output/rep-seqs-deblur.qza \
  --o-chimeras qiime2_output/chimeras.qza \
  --o-nonchimeras qiime2_output/nonchimeras.qza \
  --o-stats qiime2_output/chimera-stats.qza

qiime feature-table filter-features \
  --i-table qiime2_output/table-deblur.qza \
  --m-metadata-file qiime2_output/nonchimeras.qza \
  --o-filtered-table qiime2_output/table-nonchimeric.qza

qiime feature-table filter-seqs \
  --i-data qiime2_output/rep-seqs-deblur.qza \
  --m-metadata-file qiime2_output/nonchimeras.qza \
  --o-filtered-data qiime2_output/rep-seqs-nonchimeric.qza

echo "Denoising and chimera removal complete."
echo "Results are available in qiime2_output/"