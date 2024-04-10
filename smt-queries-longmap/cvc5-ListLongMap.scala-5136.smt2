; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69710 () Bool)

(assert start!69710)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44131 0))(
  ( (array!44132 (arr!21135 (Array (_ BitVec 32) (_ BitVec 64))) (size!21556 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44131)

(assert (=> start!69710 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21556 a!4395)) (bvslt (size!21556 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvsge (bvsub to!546 (bvadd #b00000000000000000000000000000001 from!3750)) (bvsub to!546 from!3750)))))

(assert (=> start!69710 true))

(declare-fun array_inv!16931 (array!44131) Bool)

(assert (=> start!69710 (array_inv!16931 a!4395)))

(declare-fun bs!22498 () Bool)

(assert (= bs!22498 start!69710))

(declare-fun m!754325 () Bool)

(assert (=> bs!22498 m!754325))

(push 1)

(assert (not start!69710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

