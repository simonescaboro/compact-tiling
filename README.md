# Compact Tiling problem
### Simone Scaboro - 143191

---
### Requirements
* Clingo
* MiniZinc (con Gecode)
* Python3
  
### Guida
* **asp**: cartella contenente i file per la codifica in ASP
* **mzn**: cartella contenente i file per la codifica in MiniZinc
* **results**: contiene tutti i risultati intermedi
  
Per creare le istanze di training si esegua il file `utils/generate_tests.py`. Per eseguire le istanze di training nella cartella **asp** (**mzn**), eseguire il file `tester_asp.sh` (`tester_mzn.sh`). Dopo averlo fatto per entrambe le codifiche, si esegua il file `utils/build_results.csv` per eseguire il merge delle soluzioni. I risultato finale si trova in **results/finals**.

Per la rappresentazione dei tile sulla board va copiato il risultato di ASP dai file in **asp/test/test_max_10/output** e dell'output di ogni istanza di test di MiniZinc (del file `tiling_complete.lp`), nei rispettivi file `readable_asp.py` e `readable_mzn.py`.

`init_all.sh` esegue tutti gli script: generazione istanze e test per ASP e MiniZinc.
`tester.sh` esegue dei test dei due script `readable_asp.py` e `readable_mzn.py`.