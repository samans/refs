# Extract References

## Prereqs
  - Ubuntu 24.04 LTS (this is what I tested with - may work in other environments)
    - Linux environment
  - xmllint (sudo apt install libxml2-utils)
    - Needed for both scripts
  - pyang
    - Only needed for ref-trim-uml.sh
    - Works installed in a venv, but if a venv is used make sure your venv is enabled before running the script

## Scripts
### ref-trim-yin.sh:
  - Script to loop over a directory of YANG files and will send all references to stdout
  - In this version you need to edit the shell script to update the basedir variable with a pointer to the top of the directory you want to loop over.
  - To invoke:  "bash ref-trim-yin.sh | sort | uniq >> yin-ref.out"

### ref-trim-uml.sh:
  - Script to loop over a directory of UML files and will send all references to stdout
  - In this version you need to edit the shell script to update the basedir variable with a pointer to the top of the directory you want to loop over.
  - To invoke:  "bash ref-trim-uml.sh | sort | uniq >> uml-ref.out"

### ref-trim-raw-uml.sh:
  - Script to loop over a directory of UML files and will send all references to stdout
  - Temporary solution that will print all the raw information (i.e. not running the sed scripts)
  - In this version you need to edit the shell script to update the basedir variable with a pointer to the top of the directory you want to loop over.
  - To invoke:  "bash ref-trim-raw-uml.sh | sort | uniq >> raw-uml-ref.out"

## ToDo:
  - parameterize the basedir variable
  - parameterize the "raw" option
