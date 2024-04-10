; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69694 () Bool)

(assert start!69694)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44115 0))(
  ( (array!44116 (arr!21127 (Array (_ BitVec 32) (_ BitVec 64))) (size!21548 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44115)

(assert (=> start!69694 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21548 a!4395)) (bvslt (size!21548 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsgt from!3750 to!546))))

(assert (=> start!69694 true))

(declare-fun array_inv!16923 (array!44115) Bool)

(assert (=> start!69694 (array_inv!16923 a!4395)))

(declare-fun bs!22481 () Bool)

(assert (= bs!22481 start!69694))

(declare-fun m!754309 () Bool)

(assert (=> bs!22481 m!754309))

(check-sat (not start!69694))
(check-sat)
