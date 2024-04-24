; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117844 () Bool)

(assert start!117844)

(declare-datatypes ((array!94246 0))(
  ( (array!94247 (arr!45511 (Array (_ BitVec 32) (_ BitVec 64))) (size!46062 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94246)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117844 (and (bvslt (size!46062 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46062 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsge (bvsub to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsub to!105 from!3309)))))

(declare-fun array_inv!34792 (array!94246) Bool)

(assert (=> start!117844 (array_inv!34792 a!3931)))

(assert (=> start!117844 true))

(declare-fun bs!39925 () Bool)

(assert (= bs!39925 start!117844))

(declare-fun m!1267645 () Bool)

(assert (=> bs!39925 m!1267645))

(check-sat (not start!117844))
(check-sat)
