; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117886 () Bool)

(assert start!117886)

(declare-datatypes ((array!94267 0))(
  ( (array!94268 (arr!45520 (Array (_ BitVec 32) (_ BitVec 64))) (size!46071 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94267)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117886 (and (bvslt (size!46071 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46071 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun array_inv!34801 (array!94267) Bool)

(assert (=> start!117886 (array_inv!34801 a!3931)))

(assert (=> start!117886 true))

(declare-fun bs!39937 () Bool)

(assert (= bs!39937 start!117886))

(declare-fun m!1267789 () Bool)

(assert (=> bs!39937 m!1267789))

(check-sat (not start!117886))
(check-sat)
