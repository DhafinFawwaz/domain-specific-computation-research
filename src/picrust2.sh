#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

qiime tools export \
  --input-path denoised/rep-seqs.qza \
  --output-path picrust2/exported_rep_seqs

mv picrust2/exported_rep_seqs/dna-sequences.fasta picrust2_standalone_input/rep_seqs.fna

qiime tools export \
  --input-path denoised/table.qza \
  --output-path picrust2_standalone_input/exported_table

mv picrust2_standalone_input/exported_table/feature-table.biom picrust2_standalone_input/table.biom

conda activate picrust2_env

# folder named picrust2_standalone_output must not exist. delete if exist. i know its weird
rm -rf picrust2_standalone_output

# Around 1 hours
picrust2_pipeline.py \
  -s picrust2_standalone_input/rep_seqs.fna \
  -i picrust2_standalone_input/table.biom \
  -o picrust2_standalone_output \
  -p 10

conda activate qiime2-amplicon-2024.10

gunzip picrust2_standalone_output/pathways_out/path_abun_unstrat.tsv.gz

biom convert -i picrust2_standalone_output/pathways_out/path_abun_unstrat.tsv \
             -o picrust2_standalone_output/pathways_out/path_abun.biom \
             --table-type="Pathway table" \
             --to-hdf5

qiime tools import \
  --input-path picrust2_standalone_output/pathways_out/path_abun.biom \
  --type 'FeatureTable[Frequency]' \
  --input-format BIOMV210Format \
  --output-path picrust2/pathway_abundance.qza
