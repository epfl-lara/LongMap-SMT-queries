; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69706 () Bool)

(assert start!69706)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44127 0))(
  ( (array!44128 (arr!21133 (Array (_ BitVec 32) (_ BitVec 64))) (size!21554 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44127)

(assert (=> start!69706 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21554 a!4395)) (bvslt (size!21554 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69706 true))

(declare-fun array_inv!16929 (array!44127) Bool)

(assert (=> start!69706 (array_inv!16929 a!4395)))

(declare-fun bs!22493 () Bool)

(assert (= bs!22493 start!69706))

(declare-fun m!754321 () Bool)

(assert (=> bs!22493 m!754321))

(check-sat (not start!69706))
(check-sat)
