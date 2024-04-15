; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117650 () Bool)

(assert start!117650)

(declare-datatypes ((array!94101 0))(
  ( (array!94102 (arr!45442 (Array (_ BitVec 32) (_ BitVec 64))) (size!45994 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94101)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117650 (and (bvslt (size!45994 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!45994 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun array_inv!34675 (array!94101) Bool)

(assert (=> start!117650 (array_inv!34675 a!3931)))

(assert (=> start!117650 true))

(declare-fun bs!39892 () Bool)

(assert (= bs!39892 start!117650))

(declare-fun m!1265649 () Bool)

(assert (=> bs!39892 m!1265649))

(check-sat (not start!117650))
(check-sat)
