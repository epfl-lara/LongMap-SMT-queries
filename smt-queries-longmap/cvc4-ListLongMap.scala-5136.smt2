; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69714 () Bool)

(assert start!69714)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44135 0))(
  ( (array!44136 (arr!21137 (Array (_ BitVec 32) (_ BitVec 64))) (size!21558 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44135)

(assert (=> start!69714 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21558 a!4395)) (bvslt (size!21558 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvsge (bvsub to!546 (bvadd #b00000000000000000000000000000001 from!3750)) (bvsub to!546 from!3750)))))

(assert (=> start!69714 true))

(declare-fun array_inv!16933 (array!44135) Bool)

(assert (=> start!69714 (array_inv!16933 a!4395)))

(declare-fun bs!22500 () Bool)

(assert (= bs!22500 start!69714))

(declare-fun m!754329 () Bool)

(assert (=> bs!22500 m!754329))

(push 1)

(assert (not start!69714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

