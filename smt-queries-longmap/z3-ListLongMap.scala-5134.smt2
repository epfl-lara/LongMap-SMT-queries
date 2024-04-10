; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69700 () Bool)

(assert start!69700)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44121 0))(
  ( (array!44122 (arr!21130 (Array (_ BitVec 32) (_ BitVec 64))) (size!21551 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44121)

(assert (=> start!69700 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21551 a!4395)) (bvslt (size!21551 a!4395) #b01111111111111111111111111111111) (bvslt (bvsub to!546 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69700 true))

(declare-fun array_inv!16926 (array!44121) Bool)

(assert (=> start!69700 (array_inv!16926 a!4395)))

(declare-fun bs!22487 () Bool)

(assert (= bs!22487 start!69700))

(declare-fun m!754315 () Bool)

(assert (=> bs!22487 m!754315))

(check-sat (not start!69700))
(check-sat)
