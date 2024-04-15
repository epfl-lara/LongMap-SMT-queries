; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116996 () Bool)

(assert start!116996)

(declare-datatypes ((array!93594 0))(
  ( (array!93595 (arr!45199 (Array (_ BitVec 32) (_ BitVec 64))) (size!45751 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93594)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!116996 (and (bvslt (size!45751 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45751 a!4197)) (bvslt to!360 #b00000000000000000000000000000000))))

(declare-fun array_inv!34432 (array!93594) Bool)

(assert (=> start!116996 (array_inv!34432 a!4197)))

(assert (=> start!116996 true))

(declare-fun bs!39598 () Bool)

(assert (= bs!39598 start!116996))

(declare-fun m!1261845 () Bool)

(assert (=> bs!39598 m!1261845))

(check-sat (not start!116996))
(check-sat)
