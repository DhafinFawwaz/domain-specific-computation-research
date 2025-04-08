
import os
import gzip
import shutil

def extract_files():
    for root, dirs, files in os.walk("download"):
        for file in files:
            if file.endswith(".gz"):
                with gzip.open("download/"+file, 'rb') as f_in:
                    with open("extract/"+file[:-3], 'wb') as f_out:
                        shutil.copyfileobj(f_in, f_out)

extract_files()