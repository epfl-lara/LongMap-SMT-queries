; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69708 () Bool)

(assert start!69708)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44129 0))(
  ( (array!44130 (arr!21134 (Array (_ BitVec 32) (_ BitVec 64))) (size!21555 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44129)

(assert (=> start!69708 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21555 a!4395)) (bvslt (size!21555 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69708 true))

(declare-fun array_inv!16930 (array!44129) Bool)

(assert (=> start!69708 (array_inv!16930 a!4395)))

(declare-fun bs!22494 () Bool)

(assert (= bs!22494 start!69708))

(declare-fun m!754323 () Bool)

(assert (=> bs!22494 m!754323))

(push 1)

(assert (not start!69708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

