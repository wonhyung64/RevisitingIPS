# ***Revisiting IPS in Recommendation Models: Unveiling Its Impact on Model Performance***
This repository is the official implementation of ***Revisiting IPS in Recommendation Models: Unveiling Its Impact on Model Performance*** with pytorch.


### 1. Preparation
* All package dependencies and their versions for reproducing our experimental environment are listed in `requirements.txt` file.
* The ***KuaiRec*** dataset is available for download via the provided [Google Drive](https://drive.google.com/file/d/1qe5hOSBxzIuxBb1G_Ih5X-O65QElollE/view) or the official release page (https://kuairec.com).
```
no_ips-0531
├──interaction/
│   └──data/
│      ├──KuaiRec/
│      │   ├──data/
│      │   │  ├──big_matrix.csv
│      │   │  ├──...
│      │   └──...
│      ├──yahoo_r3/
│      └──...
├──causality/
├──...
```

* Due to storage limitations, `DunnHumby: Original, Personalized` datasets need to be downloded at [here](https://github.com/wonhyung64/dunnhumby).
* Data Organization for Experiments of Causality-based Recommendation:
```
no_ips-0531
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
report_table3.sh
report_table5.sh
report_table6
report_fig3.sh
```


### 3. Code Examples
* The following files provide brief code examples demonstrating how to execute the experimental pipeline.
```
ex_interaction.ipynb
ex_causality.ipynb
```


This research was supported by the National Research Foundation of Korea(NRF) grant funded by the Korea government(MSIT) (NO. RS-2022-NR068754)
