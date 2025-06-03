

## Dataset
Download the dataset from below
[Google Drive](https://drive.google.com/drive/folders/1eVr1ytUL93SNGatfjdnTaq5hAXXJdqhN?usp=sharing)


```bash
cd src
git clone https://github.com/biobakery/MetaPhlAn.git
cd MetaPhlAn
python -m venv venv
source venv/bin/activate
pip install .
python download.py
python extract.py
```


Install Conda from
`https://www.anaconda.com/download/success`

## Install sra-tools (to download dataset)
```bash
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.2.1/sratoolkit.3.2.1-ubuntu64.tar.gz
tar -xvzf sratoolkit.3.2.1-ubuntu64.tar.gz
sh dataset.sh
```

## Install Anaconda
```bash
wget https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh
sh Anaconda3-2024.02-1-Linux-x86_64.sh
```

```bash
~/anaconda3/bin/conda env create ...
```

```bash
conda env create \
  --name qiime2-amplicon-2024.10 \
  --file https://raw.githubusercontent.com/qiime2/distributions/refs/heads/dev/2024.10/amplicon/released/qiime2-amplicon-ubuntu-latest-conda.yml
```

# Activate the environment
```bash
conda activate qiime2-amplicon-2024.10
python something.py
```
# Install dependencies
```bash
pip install Cython==0.29.37 iow==1.0.7
pip install empress
pip install gemelli
```
## Download datasets
```bash
wget https://data.qiime2.org/2023.5/common/silva-138-99-nb-classifier.qza
wget https://data.qiime2.org/2023.9/common/silva-138-99-seqs.qza
wget https://data.qiime2.org/2023.9/common/silva-138-99-tax.qza
dataset.sh
```

## Process
```bash
import.sh: generate .qza files from fastq.gz files. defined in src/qiime2_output_no_outlier/manifest.tsv. outlier is excluded, removed only 1 sample which contains only around 311 reads.
cutadapt.sh: select only the bacteria so the fungi is removed.
filter.sh: remove all instance that has less than 10000 reads. leaving only 27 samples.
denoise.sh: denoise the data using DADA2.
esearch -db sra -query "PRJNA1229183" | efetch -format runinfo > runinfo.csv
python tometadata.py
denoise-finishing.sh: visualize rep-seqs, denoising-stats, table to .qzv
taxonomy-custom.sh: generate silva-138-99-341F-909R-extracted.qza (filtered dataset), silva-138-99-341F-909R-classifier.qza (classifier naive bayes), taxonomy.qza (resulting classification with sklearn)
phylogeny.sh: generate many things with phylogeny like tree, rooted tree, unrooted tree, etc.
diversity.sh: generate many things with diversity like alpha, beta, etc.
python diversity.py: generate new sample-metadata file but with new columns for grouping
diversity-visualize.sh: visualize all the diversity results to .qzv files.

cross-validation.sh: masi nyari tau gimana dapetin kolom target
python cross-validation.py: masi nyari tau gimana dapetin kolom target
```

## Process 2
```bash
conda create -n picrust2_env -c bioconda -c conda-forge picrust2
```
