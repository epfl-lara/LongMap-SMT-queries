; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117606 () Bool)

(assert start!117606)

(declare-datatypes ((array!94124 0))(
  ( (array!94125 (arr!45455 (Array (_ BitVec 32) (_ BitVec 64))) (size!46005 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94124)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117606 (and (bvslt (size!46005 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46005 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34483 (array!94124) Bool)

(assert (=> start!117606 (array_inv!34483 a!3931)))

(assert (=> start!117606 true))

(declare-fun bs!39902 () Bool)

(assert (= bs!39902 start!117606))

(declare-fun m!1266003 () Bool)

(assert (=> bs!39902 m!1266003))

(push 1)

(assert (not start!117606))

(check-sat)

(pop 1)

(push 1)

(check-sat)
