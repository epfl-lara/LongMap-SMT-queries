# LongMap-SMT-queries

This repository contains the SMT queries generated during the verification of the `LongMap` TODO ADD LINK TO BOLTS.

The file `VCs_summary_nocache.csv` contains the list of the VCs with the following columns:

- `SMT Query ID`: The ID of the corresponding SMT-lib file in the `smt-queries-longmap` folder.
- `Position`: The position of the corresponding line in the source code.
- `Function`: The name of the function the VC corresponds to.
- `VC Details`: The details of what the VC verifies.
- `Validity`: The validity of the VC, either `valid`, or `trivial`. `trivial` means the VC is trivially valid after being simplified by Stainless' simplifier, without being sent to an SMT solver.
- `Solver`: The SMT solver that verified the VC the quickest among `z3`, `cvc4`, and `cvc5`.
- `Solving Time (sec)`: The time required to solve the VC by the solver in seconds.