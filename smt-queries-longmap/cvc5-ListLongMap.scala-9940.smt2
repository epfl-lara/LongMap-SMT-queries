; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117462 () Bool)

(assert start!117462)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94013 0))(
  ( (array!94014 (arr!45401 (Array (_ BitVec 32) (_ BitVec 64))) (size!45951 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94013)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117462 (and (bvslt (size!45951 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45951 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001)) (bvsge pivot!34 to!135))))

(declare-fun array_inv!34429 (array!94013) Bool)

(assert (=> start!117462 (array_inv!34429 a!3961)))

(assert (=> start!117462 true))

(declare-fun bs!39836 () Bool)

(assert (= bs!39836 start!117462))

(declare-fun m!1265391 () Bool)

(assert (=> bs!39836 m!1265391))

(push 1)

(assert (not start!117462))

(check-sat)

(pop 1)

(push 1)

(check-sat)

