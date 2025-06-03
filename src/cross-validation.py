import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import cross_val_score, StratifiedKFold
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score
from sklearn.metrics import classification_report, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns

feature_table = pd.read_csv('cross-validation/feature-table-for-ml.tsv', sep='\t', index_col=0, skiprows=1)
metadata = pd.read_csv('denoised/sample-metadata.tsv', sep='\t', index_col=0)

print("Available columns in metadata:")
print(metadata.columns.tolist())
print("\nFirst few rows of metadata:")
print(metadata.head())

X = feature_table.T
y = metadata.loc[X.index, 'source']

rf = RandomForestClassifier(n_estimators=100, random_state=42)
cv = StratifiedKFold(n_splits=5, shuffle=True, random_state=42)

cv_scores = cross_val_score(rf, X, y, cv=cv, scoring='accuracy')
precision_scores = cross_val_score(rf, X, y, cv=cv, scoring='precision_macro')
recall_scores = cross_val_score(rf, X, y, cv=cv, scoring='recall_macro')
f1_scores = cross_val_score(rf, X, y, cv=cv, scoring='f1_macro')

print(f"Accuracy: {cv_scores.mean():.3f} ± {cv_scores.std():.3f}")
print(f"Precision: {precision_scores.mean():.3f} ± {precision_scores.std():.3f}")
print(f"Recall: {recall_scores.mean():.3f} ± {recall_scores.std():.3f}")
print(f"F1-score: {f1_scores.mean():.3f} ± {f1_scores.std():.3f}")