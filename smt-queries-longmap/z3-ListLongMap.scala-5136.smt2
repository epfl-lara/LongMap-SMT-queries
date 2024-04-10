; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69712 () Bool)

(assert start!69712)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44133 0))(
  ( (array!44134 (arr!21136 (Array (_ BitVec 32) (_ BitVec 64))) (size!21557 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44133)

(assert (=> start!69712 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21557 a!4395)) (bvslt (size!21557 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvsge (bvsub to!546 (bvadd #b00000000000000000000000000000001 from!3750)) (bvsub to!546 from!3750)))))

(assert (=> start!69712 true))

(declare-fun array_inv!16932 (array!44133) Bool)

(assert (=> start!69712 (array_inv!16932 a!4395)))

(declare-fun bs!22499 () Bool)

(assert (= bs!22499 start!69712))

(declare-fun m!754327 () Bool)

(assert (=> bs!22499 m!754327))

(check-sat (not start!69712))
(check-sat)
