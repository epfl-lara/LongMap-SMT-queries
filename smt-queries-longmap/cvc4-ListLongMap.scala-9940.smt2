; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117466 () Bool)

(assert start!117466)

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94017 0))(
  ( (array!94018 (arr!45403 (Array (_ BitVec 32) (_ BitVec 64))) (size!45953 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94017)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117466 (and (bvslt (size!45953 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45953 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001)) (bvsge pivot!34 to!135))))

(declare-fun array_inv!34431 (array!94017) Bool)

(assert (=> start!117466 (array_inv!34431 a!3961)))

(assert (=> start!117466 true))

(declare-fun bs!39838 () Bool)

(assert (= bs!39838 start!117466))

(declare-fun m!1265395 () Bool)

(assert (=> bs!39838 m!1265395))

(push 1)

(assert (not start!117466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

