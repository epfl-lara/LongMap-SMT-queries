; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69704 () Bool)

(assert start!69704)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44125 0))(
  ( (array!44126 (arr!21132 (Array (_ BitVec 32) (_ BitVec 64))) (size!21553 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44125)

(assert (=> start!69704 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21553 a!4395)) (bvslt (size!21553 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69704 true))

(declare-fun array_inv!16928 (array!44125) Bool)

(assert (=> start!69704 (array_inv!16928 a!4395)))

(declare-fun bs!22492 () Bool)

(assert (= bs!22492 start!69704))

(declare-fun m!754319 () Bool)

(assert (=> bs!22492 m!754319))

(push 1)

(assert (not start!69704))

(check-sat)

(pop 1)

(push 1)

(check-sat)

