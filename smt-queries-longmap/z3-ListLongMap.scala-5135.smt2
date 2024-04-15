; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69684 () Bool)

(assert start!69684)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44122 0))(
  ( (array!44123 (arr!21131 (Array (_ BitVec 32) (_ BitVec 64))) (size!21552 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44122)

(assert (=> start!69684 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21552 a!4395)) (bvslt (size!21552 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69684 true))

(declare-fun array_inv!17014 (array!44122) Bool)

(assert (=> start!69684 (array_inv!17014 a!4395)))

(declare-fun bs!22461 () Bool)

(assert (= bs!22461 start!69684))

(declare-fun m!753577 () Bool)

(assert (=> bs!22461 m!753577))

(check-sat (not start!69684))
(check-sat)
