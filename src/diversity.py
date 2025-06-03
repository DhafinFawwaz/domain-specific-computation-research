import pandas as pd
import re

df = pd.read_csv('denoised/sample-metadata.tsv', sep='\t')

def extract_groups(library_name):
    match = re.match(r'^([^_]+)', library_name)
    if match:
        code = match.group(1)
        
        if re.match(r'^\d+[A-Z]$', code):
            letter = code[-1]
            number = code[:-1]
            return f"Group_{letter}", f"Batch_{number}"
        elif re.match(r'^\d+$', code):
            num = int(code)
            if num >= 30:
                return "High_Numbers", f"Range_{num//10}0s"
            elif num >= 20:
                return "Mid_Numbers", f"Range_{num//10}0s" 
            else:
                return "Low_Numbers", f"Range_{num//10}0s"
    
    return "Other", "Unknown"

df[['treatment_group', 'batch']] = df['library-name'].apply(
    lambda x: pd.Series(extract_groups(x))
)

df['seq_depth_category'] = pd.cut(df['spots'], 
                                 bins=[0, 50000, 100000, 200000, float('inf')],
                                 labels=['Low', 'Medium', 'High', 'Very_High'])

df['size_category'] = pd.cut(df['size-mb'], 
                            bins=[0, 10, 20, 30, float('inf')],
                            labels=['Small', 'Medium', 'Large', 'Very_Large'])

df['length_category'] = df['avg-length'].apply(
    lambda x: 'Short_251' if x == 251 else 'Long_301' if x == 301 else 'Other'
)

cols = ['sample-id', 'treatment_group', 'batch', 'seq_depth_category', 
        'size_category', 'length_category'] + [col for col in df.columns 
        if col not in ['sample-id', 'treatment_group', 'batch', 'seq_depth_category', 
                       'size_category', 'length_category']]

df = df[cols]

df.to_csv('diversity/sample-metadata-grouped.tsv', sep='\t', index=False)

print("New metadata file created: diversity/sample-metadata-grouped.tsv")
print("\nGrouping summary:")
print("Treatment groups:", df['treatment_group'].value_counts().to_dict())
print("Batch groups:", df['batch'].value_counts().to_dict())
print("Sequence depth categories:", df['seq_depth_category'].value_counts().to_dict())
print("Size categories:", df['size_category'].value_counts().to_dict())
print("Length categories:", df['length_category'].value_counts().to_dict())

print("\nFirst 10 rows of new metadata:")
print(df[['sample-id', 'treatment_group', 'batch', 'seq_depth_category', 'size_category', 'length_category']].head(10))