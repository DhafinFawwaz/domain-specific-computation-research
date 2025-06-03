import pandas as pd

df = pd.read_csv('runinfo.csv')

metadata = pd.DataFrame({
    'sample-id': df['Run'], # SRR IDs
    'sample-name': df['SampleName'], # Original sample names (a1, a10, a11, etc.)
    'library-name': df['LibraryName'], # Original library names
    'bioproject': df['BioProject'],
    'biosample': df['BioSample'], 
    'library-strategy': df['LibraryStrategy'],
    'library-source': df['LibrarySource'],
    'library-layout': df['LibraryLayout'],
    'platform': df['Platform'],
    'model': df['Model'],
    'spots': df['spots'], # Number of reads
    'bases': df['bases'], # Total bases
    'avg-length': df['avgLength'], # Average read length
    'size-mb': df['size_MB'] # File size
})

metadata = metadata.sort_values('sample-id')

metadata = metadata[metadata['sample-id'].isin(include_samples)]

metadata.to_csv('denoised/sample-metadata.tsv', sep='\t', index=False)

print("Created sample-metadata.tsv with", len(metadata), "samples")
print(f"Unique sample names: {sorted(metadata['sample-name'].unique())}")