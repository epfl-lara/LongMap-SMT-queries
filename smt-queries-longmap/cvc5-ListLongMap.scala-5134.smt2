; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69698 () Bool)

(assert start!69698)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44119 0))(
  ( (array!44120 (arr!21129 (Array (_ BitVec 32) (_ BitVec 64))) (size!21550 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44119)

(assert (=> start!69698 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21550 a!4395)) (bvslt (size!21550 a!4395) #b01111111111111111111111111111111) (bvslt (bvsub to!546 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69698 true))

(declare-fun array_inv!16925 (array!44119) Bool)

(assert (=> start!69698 (array_inv!16925 a!4395)))

(declare-fun bs!22486 () Bool)

(assert (= bs!22486 start!69698))

(declare-fun m!754313 () Bool)

(assert (=> bs!22486 m!754313))

(push 1)

(assert (not start!69698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

