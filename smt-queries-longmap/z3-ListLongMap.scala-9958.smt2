; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117608 () Bool)

(assert start!117608)

(declare-datatypes ((array!94126 0))(
  ( (array!94127 (arr!45456 (Array (_ BitVec 32) (_ BitVec 64))) (size!46006 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94126)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117608 (and (bvslt (size!46006 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46006 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34484 (array!94126) Bool)

(assert (=> start!117608 (array_inv!34484 a!3931)))

(assert (=> start!117608 true))

(declare-fun bs!39903 () Bool)

(assert (= bs!39903 start!117608))

(declare-fun m!1266005 () Bool)

(assert (=> bs!39903 m!1266005))

(check-sat (not start!117608))
(check-sat)
