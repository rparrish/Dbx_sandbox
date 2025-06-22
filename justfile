
recipe-name:
  @just --list 

# this is a comment
another-recipe:
  @echo 'This is another recipe.'

# start-cluster
start-cluster:
  databricks clusters start 0608-161050-5rkxidtd -p Dev

stop-cluster:
  @databricks clusters stop 0608-161050-5rkxidtd -p Dev

#[working-directory: 'ccdm']
[working-directory: 'mimic-iv-demo']
deploy:
   @databricks bundle validate -p Dev && \
   databricks bundle deploy -p Dev
   
