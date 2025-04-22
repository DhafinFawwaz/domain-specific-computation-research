

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