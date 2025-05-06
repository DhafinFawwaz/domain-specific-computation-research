# https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fasta?acc=SRR32507895

import os
import requests

def download_file(url, filename):
    with open(filename, 'wb') as handle:
        response = requests.get(url, stream=True)
        if not response.ok:
            print(response)
        for block in response.iter_content(1024):
            if not block:
                break
            handle.write(block)

def download_files():
    base_urls = "https://trace.ncbi.nlm.nih.gov/Traces/sra-reads-be/fastq?acc=SRR32507"
    if not os.path.exists("download"): os.makedirs("download")
    for i in range(915, 949):
        url = base_urls + str(i)
        filename = "download/SRR32507" + str(i) + ".fastq.gz"
        download_file(url, filename)

download_files()
    