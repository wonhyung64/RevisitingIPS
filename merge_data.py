import os
import pandas as pd


def merge_csv_files(input_dir, file_name):
    all_files = sorted(f for f in os.listdir(input_dir) if f.startswith(f"{file_name}_") and f.endswith(".csv"))
    dfs = [pd.read_csv(os.path.join(input_dir, f)) for f in all_files]
    pd.concat(dfs, ignore_index=True).to_csv(f"{input_dir}/{file_name}.csv", index=False)


if __name__ == "__main__":
    merge_csv_files("./causality/data/dunn_cat_mailer_10_10_1_1/original_rp0.40", "data_vali")
    merge_csv_files("./causality/data/dunn_cat_mailer_10_10_1_1/original_rp0.40", "data_test")
    merge_csv_files("./causality/data/dunn_cat_mailer_10_10_1_1/rank_rp0.40_sf2.00_nr210", "data_vali")
    merge_csv_files("./causality/data/dunn_cat_mailer_10_10_1_1/rank_rp0.40_sf2.00_nr210", "data_test")
