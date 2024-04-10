; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117656 () Bool)

(assert start!117656)

(declare-datatypes ((array!94153 0))(
  ( (array!94154 (arr!45468 (Array (_ BitVec 32) (_ BitVec 64))) (size!46018 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94153)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117656 (and (bvslt (size!46018 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46018 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun array_inv!34496 (array!94153) Bool)

(assert (=> start!117656 (array_inv!34496 a!3931)))

(assert (=> start!117656 true))

(declare-fun bs!39921 () Bool)

(assert (= bs!39921 start!117656))

(declare-fun m!1266155 () Bool)

(assert (=> bs!39921 m!1266155))

(check-sat (not start!117656))
(check-sat)
