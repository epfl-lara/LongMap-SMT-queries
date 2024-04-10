; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117602 () Bool)

(assert start!117602)

(declare-datatypes ((array!94120 0))(
  ( (array!94121 (arr!45453 (Array (_ BitVec 32) (_ BitVec 64))) (size!46003 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94120)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117602 (and (bvslt (size!46003 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46003 a!3931)) (bvslt (bvsub to!105 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34481 (array!94120) Bool)

(assert (=> start!117602 (array_inv!34481 a!3931)))

(assert (=> start!117602 true))

(declare-fun bs!39897 () Bool)

(assert (= bs!39897 start!117602))

(declare-fun m!1265999 () Bool)

(assert (=> bs!39897 m!1265999))

(check-sat (not start!117602))
(check-sat)
