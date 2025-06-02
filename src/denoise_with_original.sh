#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime dada2 denoise-single \
  --i-demultiplexed-seqs qiime2_output_no_outlier/demux-seqs.qza \
  --p-trim-left 0 \
  --p-trunc-len 150 \
  --p-n-reads-learn 1000 \
  --p-max-ee 5 \
  --p-trunc-q 0 \
  --o-representative-sequences denoised/rep-seqs.qza \
  --o-table denoised/table.qza \
  --o-denoising-stats denoised/denoising-stats.qza

qiime demux summarize \
  --i-data denoised/demux-denoised.qza \
  --o-visualization denoised/demux-denoised-sumary