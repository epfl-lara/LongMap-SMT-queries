; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69864 () Bool)

(assert start!69864)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44117 0))(
  ( (array!44118 (arr!21123 (Array (_ BitVec 32) (_ BitVec 64))) (size!21543 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44117)

(assert (=> start!69864 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21543 a!4395)) (bvslt (size!21543 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsgt from!3750 to!546))))

(assert (=> start!69864 true))

(declare-fun array_inv!16982 (array!44117) Bool)

(assert (=> start!69864 (array_inv!16982 a!4395)))

(declare-fun bs!22498 () Bool)

(assert (= bs!22498 start!69864))

(declare-fun m!755597 () Bool)

(assert (=> bs!22498 m!755597))

(push 1)

(assert (not start!69864))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

