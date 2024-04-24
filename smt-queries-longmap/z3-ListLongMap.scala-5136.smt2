; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69878 () Bool)

(assert start!69878)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44131 0))(
  ( (array!44132 (arr!21130 (Array (_ BitVec 32) (_ BitVec 64))) (size!21550 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44131)

(assert (=> start!69878 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21550 a!4395)) (bvslt (size!21550 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvsge (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000) (bvsge (bvsub to!546 (bvadd #b00000000000000000000000000000001 from!3750)) (bvsub to!546 from!3750)))))

(assert (=> start!69878 true))

(declare-fun array_inv!16989 (array!44131) Bool)

(assert (=> start!69878 (array_inv!16989 a!4395)))

(declare-fun bs!22514 () Bool)

(assert (= bs!22514 start!69878))

(declare-fun m!755611 () Bool)

(assert (=> bs!22514 m!755611))

(check-sat (not start!69878))
(check-sat)
