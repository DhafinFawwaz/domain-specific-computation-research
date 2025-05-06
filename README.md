

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


```bash
conda env create \
  --name qiime2-amplicon-2024.10 \
  --file https://raw.githubusercontent.com/qiime2/distributions/refs/heads/dev/2024.10/amplicon/released/qiime2-amplicon-ubuntu-latest-conda.yml
```