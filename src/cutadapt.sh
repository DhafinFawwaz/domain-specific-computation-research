#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime cutadapt trim-single \
  --i-demultiplexed-sequences qiime2_output_no_outlier/demux-seqs.qza \
  --p-front CCTACGGGRSGCAGCAG \
  --p-adapter TTTCAGYCTTGCGRCCGTAC \
  --p-discard-untrimmed \
  --o-trimmed-sequences cutadapt/demux-bacteria.qza

qiime demux summarize \
  --i-data cutadapt/demux-bacteria.qza \
  --o-visualization cutadapt/demux-bacteria-sumary