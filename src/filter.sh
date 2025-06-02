#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime demux filter-samples \
  --i-demux cutadapt/demux-bacteria.qza \
  --m-metadata-file filtered/metadata.tsv \
  --o-filtered-demux filtered/demux-filtered.qza

qiime demux summarize \
  --i-data filtered/demux-filtered.qza \
  --o-visualization filtered/demux-filtered-sumary