; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69672 () Bool)

(assert start!69672)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44110 0))(
  ( (array!44111 (arr!21125 (Array (_ BitVec 32) (_ BitVec 64))) (size!21546 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44110)

(assert (=> start!69672 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21546 a!4395)) (bvslt (size!21546 a!4395) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsgt from!3750 to!546))))

(assert (=> start!69672 true))

(declare-fun array_inv!17008 (array!44110) Bool)

(assert (=> start!69672 (array_inv!17008 a!4395)))

(declare-fun bs!22449 () Bool)

(assert (= bs!22449 start!69672))

(declare-fun m!753565 () Bool)

(assert (=> bs!22449 m!753565))

(check-sat (not start!69672))
(check-sat)
