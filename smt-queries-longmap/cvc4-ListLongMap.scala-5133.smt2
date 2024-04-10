; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69696 () Bool)

(assert start!69696)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44117 0))(
  ( (array!44118 (arr!21128 (Array (_ BitVec 32) (_ BitVec 64))) (size!21549 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44117)

(assert (=> start!69696 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21549 a!4395)) (bvslt (size!21549 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsgt from!3750 to!546))))

(assert (=> start!69696 true))

(declare-fun array_inv!16924 (array!44117) Bool)

(assert (=> start!69696 (array_inv!16924 a!4395)))

(declare-fun bs!22482 () Bool)

(assert (= bs!22482 start!69696))

(declare-fun m!754311 () Bool)

(assert (=> bs!22482 m!754311))

(push 1)

(assert (not start!69696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

