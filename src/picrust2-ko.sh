#!/bin/bash

eval "$(conda shell.bash hook)"

conda activate qiime2-amplicon-2024.10

gunzip picrust2_standalone_output/KO_metagenome_out/pred_metagenome_unstrat.tsv.gz

biom convert \
  -i picrust2_standalone_output/KO_metagenome_out/pred_metagenome_unstrat.tsv \
  -o picrust2-ko/KO_metagenome_out/ko_predictions.biom \
  --table-type="Gene table" \
  --to-hdf5

qiime tools import \
  --input-path picrust2-ko/KO_metagenome_out/ko_predictions.biom \
  --type 'FeatureTable[Frequency]' \
  --output-path picrust2-ko/ko_predictions.qza

qiime feature-table summarize \
  --i-table picrust2-ko/ko_predictions.qza \
  --o-visualization picrust2-ko/ko_predictions_summary.qzv \
  --m-sample-metadata-file denoised/sample-metadata.tsv