# Ocaml first project


Aim to parse a tabular file with three columns 
The 3rd column is optional

| blabla | blabal | blabala | 
| bloblo | bloblo |
| blibli | blibli |


### required 

- dune
- opam
- re
- str
- Ounits (for unitary test)


### Run

```
dune build app/demo.exe
./_build/default/app/demo.exe "tests/test_dev.tab" 
``
