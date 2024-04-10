; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117610 () Bool)

(assert start!117610)

(declare-datatypes ((array!94128 0))(
  ( (array!94129 (arr!45457 (Array (_ BitVec 32) (_ BitVec 64))) (size!46007 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94128)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117610 (and (bvslt (size!46007 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46007 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34485 (array!94128) Bool)

(assert (=> start!117610 (array_inv!34485 a!3931)))

(assert (=> start!117610 true))

(declare-fun bs!39904 () Bool)

(assert (= bs!39904 start!117610))

(declare-fun m!1266007 () Bool)

(assert (=> bs!39904 m!1266007))

(push 1)

(assert (not start!117610))

(check-sat)

(pop 1)

(push 1)

(check-sat)

