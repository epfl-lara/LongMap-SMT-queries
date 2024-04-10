; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117004 () Bool)

(assert start!117004)

(declare-datatypes ((array!93646 0))(
  ( (array!93647 (arr!45225 (Array (_ BitVec 32) (_ BitVec 64))) (size!45775 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93646)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!117004 (and (bvslt (size!45775 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45775 a!4197)) (bvslt to!360 #b00000000000000000000000000000000))))

(declare-fun array_inv!34253 (array!93646) Bool)

(assert (=> start!117004 (array_inv!34253 a!4197)))

(assert (=> start!117004 true))

(declare-fun bs!39628 () Bool)

(assert (= bs!39628 start!117004))

(declare-fun m!1262359 () Bool)

(assert (=> bs!39628 m!1262359))

(check-sat (not start!117004))
(check-sat)
