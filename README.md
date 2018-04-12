# 7.GEO_data_analyisis_by_R

Step 1:
  According to the "bioconductor_arraydata.R" to download GEO data, normalization and annotation.
  and will generate "*.txt" file, The gene name is on the last column, and move the name to the first column by manual operation.
  
Step 2:
  Running the script "combine_gene.pl". 
  The input format such as : $perl combine_gene.pl GSE20986.txt GSE20986_combine_gene.txt. 
  After that we obtained the file with unique gene, and combine with median method.
  
Step 3:
Running the script "combine_data.pl".
For example: $ perl combine_data.pl dataset1.txt dataset2.txt combine_data.txt
After that we obtained the file which combined multiple datasets.
