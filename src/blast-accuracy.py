import pandas as pd

df = pd.read_csv('taxonomy_blast_comparison.csv')

# count how many Match = 1
match_count = 0
data = df['Match'].tolist()
for match in data:
    if int(match) == 1:
        match_count += 1

df_len = len(df)
accuracy = (match_count / df_len) * 100 if df_len > 0 else 0
print(f"Total samples: {df_len}")
print(f"Matched samples: {match_count}")
print(f"Accuracy: {accuracy:.2f}%")