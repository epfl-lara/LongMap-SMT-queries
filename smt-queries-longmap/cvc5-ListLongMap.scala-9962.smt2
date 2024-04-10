; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117654 () Bool)

(assert start!117654)

(declare-datatypes ((array!94151 0))(
  ( (array!94152 (arr!45467 (Array (_ BitVec 32) (_ BitVec 64))) (size!46017 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94151)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117654 (and (bvslt (size!46017 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46017 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvsub to!105 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun array_inv!34495 (array!94151) Bool)

(assert (=> start!117654 (array_inv!34495 a!3931)))

(assert (=> start!117654 true))

(declare-fun bs!39920 () Bool)

(assert (= bs!39920 start!117654))

(declare-fun m!1266153 () Bool)

(assert (=> bs!39920 m!1266153))

(push 1)

(assert (not start!117654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

