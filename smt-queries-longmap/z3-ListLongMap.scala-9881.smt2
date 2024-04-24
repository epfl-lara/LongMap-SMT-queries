; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117232 () Bool)

(assert start!117232)

(declare-datatypes ((array!93760 0))(
  ( (array!93761 (arr!45277 (Array (_ BitVec 32) (_ BitVec 64))) (size!45828 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93760)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!117232 (and (bvslt (size!45828 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45828 a!4197)) (bvslt to!360 #b00000000000000000000000000000000))))

(declare-fun array_inv!34558 (array!93760) Bool)

(assert (=> start!117232 (array_inv!34558 a!4197)))

(assert (=> start!117232 true))

(declare-fun bs!39643 () Bool)

(assert (= bs!39643 start!117232))

(declare-fun m!1263985 () Bool)

(assert (=> bs!39643 m!1263985))

(check-sat (not start!117232))
(check-sat)
