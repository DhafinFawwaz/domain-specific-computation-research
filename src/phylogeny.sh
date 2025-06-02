#!/bin/bash

# Initialize conda for this shell session
eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

# qiime phylogeny align-to-tree-mafft-fasttree \
#   --i-sequences denoised/rep-seqs.qza \
#   --o-alignment phylogeny/aligned-rep-seqs.qza \
#   --o-masked-alignment phylogeny/masked-aligned-rep-seqs.qza \
#   --o-tree phylogeny/unrooted-tree.qza \
#   --o-rooted-tree phylogeny/rooted-tree.qza

# generate qsv files for phylogeny using empress
# with only taxonomoy information
qiime empress tree-plot \
    --i-tree phylogeny/rooted-tree.qza \
    --m-feature-metadata-file taxonomy/taxonomy.qza \
    --o-visulatization phylogeny/empress-tree-tax.qzv

# with taxonomy and feature table information
qiime empress tree-plot \
    --i-tree phylogeny/rooted-tree.qza \
    --i-feature-table denoised/table.qza \
    --m-sample-metadata-file denoised/sample-metadata.tsv \
    --m-feature-metadata-file taxonomy/taxonomy.qza \
    --o-visualization phylogeny/empress-tree-tax-with-table.qzv