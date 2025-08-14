### Simulation codes for
# ***Revisiting IPS in Recommendation Models: Unveiling Its Impact on Model Performance***

### 1. Preparation
* All package dependencies and their versions for reproducing our experimental environment are listed in `requirements.txt` file.
* Due to storage limitations, `DunnHumby: Original, Personalized` datasets need to be downloded at [anoymous github](https://anonymous.4open.science/r/dunn_cat_mailer_10_10_1_1/).
* Data Organization for Experiments of Causality-based Recommendation:
```
no_ips-0532
├──causality/
│   └──data/
│      └──dunn_cat_mailer_10_10_1_1/
│         ├──original_rp0.40/
│         │  ├──data_test_000.csv
│         │  ├──...
│         │  ├──data_test_057.csv
│         │  ├──data_vali_000.csv
│         │  ├──...
│         │  └──data_vali_018.csv
│         └──rank_rp0.40_sf2.00_nr210/
│            ├──data_test_000.csv
│            ├──...
│            ├──data_test_056.csv
│            ├──data_vali_000.csv
│            ├──...
│            └──data_vali_021.csv
├──interaction/
├──...

```
* After dowloading the full data, please run `merge_data.py`.
  

### 2. Main Results
* The following files reproduce the main results and include all the hyperparameter settings.
```
report_table1.sh
report_table2.sh
report_table3.sh
report_table4_interaction.sh
report_table4_causality.sh
report_fig3.sh
```


### 3. Code Examples
* The following files provide brief code examples demonstrating how to execute the experimental pipeline.
```
ex_interaction.ipynb
ex_causality.ipynb
```
