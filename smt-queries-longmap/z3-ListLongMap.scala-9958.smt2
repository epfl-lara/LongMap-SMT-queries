; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117838 () Bool)

(assert start!117838)

(declare-datatypes ((array!94240 0))(
  ( (array!94241 (arr!45508 (Array (_ BitVec 32) (_ BitVec 64))) (size!46059 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94240)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117838 (and (bvslt (size!46059 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46059 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34789 (array!94240) Bool)

(assert (=> start!117838 (array_inv!34789 a!3931)))

(assert (=> start!117838 true))

(declare-fun bs!39919 () Bool)

(assert (= bs!39919 start!117838))

(declare-fun m!1267639 () Bool)

(assert (=> bs!39919 m!1267639))

(check-sat (not start!117838))
(check-sat)
