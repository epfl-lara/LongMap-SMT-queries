; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69678 () Bool)

(assert start!69678)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44116 0))(
  ( (array!44117 (arr!21128 (Array (_ BitVec 32) (_ BitVec 64))) (size!21549 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44116)

(assert (=> start!69678 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21549 a!4395)) (bvslt (size!21549 a!4395) #b01111111111111111111111111111111) (bvslt (bvsub to!546 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69678 true))

(declare-fun array_inv!17011 (array!44116) Bool)

(assert (=> start!69678 (array_inv!17011 a!4395)))

(declare-fun bs!22455 () Bool)

(assert (= bs!22455 start!69678))

(declare-fun m!753571 () Bool)

(assert (=> bs!22455 m!753571))

(check-sat (not start!69678))
(check-sat)
