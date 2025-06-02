#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime tools import \
  --type 'SampleData[SequencesWithQuality]' \
  --input-path qiime2_output_no_outlier/manifest.tsv \
  --output-path qiime2_output_no_outlier/demux-seqs.qza \
  --input-format SingleEndFastqManifestPhred33V2


qiime demux summarize \
  --i-data qiime2_output_no_outlier/demux-seqs.qza \
  --o-visualization qiime2_output_no_outlier/demux-seqs-sumary
