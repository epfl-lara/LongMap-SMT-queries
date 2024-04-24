; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69866 () Bool)

(assert start!69866)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44119 0))(
  ( (array!44120 (arr!21124 (Array (_ BitVec 32) (_ BitVec 64))) (size!21544 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44119)

(assert (=> start!69866 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21544 a!4395)) (bvslt (size!21544 a!4395) #b01111111111111111111111111111111) (bvslt (bvsub to!546 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69866 true))

(declare-fun array_inv!16983 (array!44119) Bool)

(assert (=> start!69866 (array_inv!16983 a!4395)))

(declare-fun bs!22502 () Bool)

(assert (= bs!22502 start!69866))

(declare-fun m!755599 () Bool)

(assert (=> bs!22502 m!755599))

(check-sat (not start!69866))
(check-sat)
