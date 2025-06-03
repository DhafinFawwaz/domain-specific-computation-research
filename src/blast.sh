#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

# qiime feature-classifier classify-consensus-blast \
#   --i-query denoised/rep-seqs.qza \
#   --i-reference-reads silva-138-99-seqs.qza \
#   --i-reference-taxonomy silva-138-99-tax.qza \
#   --p-perc-identity 0.97 \
#   --o-classification taxonomy.qza

qiime tools export --input-path denoised/rep-seqs.qzv --output-path blast/exported-rep-seqs
qiime tools export --input-path taxonomy-custom/taxonomy.qza --output-path blast/exported-taxonomy
