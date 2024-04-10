; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69702 () Bool)

(assert start!69702)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44123 0))(
  ( (array!44124 (arr!21131 (Array (_ BitVec 32) (_ BitVec 64))) (size!21552 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44123)

(assert (=> start!69702 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21552 a!4395)) (bvslt (size!21552 a!4395) #b01111111111111111111111111111111) (bvslt (bvsub to!546 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69702 true))

(declare-fun array_inv!16927 (array!44123) Bool)

(assert (=> start!69702 (array_inv!16927 a!4395)))

(declare-fun bs!22488 () Bool)

(assert (= bs!22488 start!69702))

(declare-fun m!754317 () Bool)

(assert (=> bs!22488 m!754317))

(push 1)

(assert (not start!69702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

