; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69872 () Bool)

(assert start!69872)

(declare-fun from!3750 () (_ BitVec 32))

(declare-fun to!546 () (_ BitVec 32))

(declare-datatypes ((array!44125 0))(
  ( (array!44126 (arr!21127 (Array (_ BitVec 32) (_ BitVec 64))) (size!21547 (_ BitVec 32))) )
))
(declare-fun a!4395 () array!44125)

(assert (=> start!69872 (and (bvsge from!3750 #b00000000000000000000000000000000) (bvslt from!3750 to!546) (bvsle to!546 (size!21547 a!4395)) (bvslt (size!21547 a!4395) #b01111111111111111111111111111111) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) to!546) (bvslt (bvadd #b00000000000000000000000000000001 from!3750) #b00000000000000000000000000000000))))

(assert (=> start!69872 true))

(declare-fun array_inv!16986 (array!44125) Bool)

(assert (=> start!69872 (array_inv!16986 a!4395)))

(declare-fun bs!22508 () Bool)

(assert (= bs!22508 start!69872))

(declare-fun m!755605 () Bool)

(assert (=> bs!22508 m!755605))

(check-sat (not start!69872))
(check-sat)
