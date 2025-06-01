#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

# Activate the QIIME2 environment
conda activate qiime2-amplicon-2024.10

qiime metadata tabulate \
  --m-input-file qiime2_output/nonchimeras.qza \
  --o-visualization nonchimera-qsv/nonchimeras.qzv

qiime feature-table tabulate-seqs \
  --i-data qiime2_output/rep-seqs-nonchimeric.qza \
  --o-visualization nonchimera-qsv/rep-seqs-nonchimeric.qzv

qiime feature-table summarize \
  --i-table qiime2_output/table-nonchimeric.qza \
  --o-visualization nonchimera-qsv/table-nonchimeric.qzv