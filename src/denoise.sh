#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime dada2 denoise-single \
  --i-demultiplexed-seqs filtered/demux-filtered.qza \
  --p-trim-left 0 \
  --p-trunc-len 190 \
  --p-n-reads-learn 100000 \
  --o-representative-sequences denoised/rep-seqs.qza \
  --o-table denoised/table.qza \
  --o-denoising-stats denoised/denoising-stats.qza\
  --verbose

