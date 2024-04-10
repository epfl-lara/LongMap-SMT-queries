; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117614 () Bool)

(assert start!117614)

(declare-datatypes ((array!94132 0))(
  ( (array!94133 (arr!45459 (Array (_ BitVec 32) (_ BitVec 64))) (size!46009 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94132)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117614 (and (bvslt (size!46009 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46009 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsge (bvsub to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsub to!105 from!3309)))))

(declare-fun array_inv!34487 (array!94132) Bool)

(assert (=> start!117614 (array_inv!34487 a!3931)))

(assert (=> start!117614 true))

(declare-fun bs!39909 () Bool)

(assert (= bs!39909 start!117614))

(declare-fun m!1266011 () Bool)

(assert (=> bs!39909 m!1266011))

(check-sat (not start!117614))
(check-sat)
