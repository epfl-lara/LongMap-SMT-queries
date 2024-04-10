; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117658 () Bool)

(assert start!117658)

(declare-datatypes ((array!94155 0))(
  ( (array!94156 (arr!45469 (Array (_ BitVec 32) (_ BitVec 64))) (size!46019 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94155)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117658 (and (bvslt (size!46019 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46019 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun array_inv!34497 (array!94155) Bool)

(assert (=> start!117658 (array_inv!34497 a!3931)))

(assert (=> start!117658 true))

(declare-fun bs!39922 () Bool)

(assert (= bs!39922 start!117658))

(declare-fun m!1266157 () Bool)

(assert (=> bs!39922 m!1266157))

(push 1)

(assert (not start!117658))

(check-sat)

(pop 1)

(push 1)

(check-sat)

