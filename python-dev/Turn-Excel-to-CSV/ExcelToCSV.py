import pandas as pd

excel_file = pd.read_excel('./src-Excel/06. Product Attributes - Master.xlsx', index_col=None)

excel_file.to_csv('./trg-CSV/csvfile.csv', encoding='utf-8', index=False)