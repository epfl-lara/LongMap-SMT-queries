; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117600 () Bool)

(assert start!117600)

(declare-datatypes ((array!94118 0))(
  ( (array!94119 (arr!45452 (Array (_ BitVec 32) (_ BitVec 64))) (size!46002 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94118)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117600 (and (bvslt (size!46002 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46002 a!3931)) (bvslt (bvsub to!105 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34480 (array!94118) Bool)

(assert (=> start!117600 (array_inv!34480 a!3931)))

(assert (=> start!117600 true))

(declare-fun bs!39896 () Bool)

(assert (= bs!39896 start!117600))

(declare-fun m!1265997 () Bool)

(assert (=> bs!39896 m!1265997))

(push 1)

(assert (not start!117600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

