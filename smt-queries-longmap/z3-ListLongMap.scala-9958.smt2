; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117602 () Bool)

(assert start!117602)

(declare-datatypes ((array!94074 0))(
  ( (array!94075 (arr!45430 (Array (_ BitVec 32) (_ BitVec 64))) (size!45982 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94074)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117602 (and (bvslt (size!45982 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45982 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34663 (array!94074) Bool)

(assert (=> start!117602 (array_inv!34663 a!3931)))

(assert (=> start!117602 true))

(declare-fun bs!39874 () Bool)

(assert (= bs!39874 start!117602))

(declare-fun m!1265499 () Bool)

(assert (=> bs!39874 m!1265499))

(check-sat (not start!117602))
(check-sat)
