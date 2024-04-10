; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117612 () Bool)

(assert start!117612)

(declare-datatypes ((array!94130 0))(
  ( (array!94131 (arr!45458 (Array (_ BitVec 32) (_ BitVec 64))) (size!46008 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94130)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117612 (and (bvslt (size!46008 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46008 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsge (bvsub to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsub to!105 from!3309)))))

(declare-fun array_inv!34486 (array!94130) Bool)

(assert (=> start!117612 (array_inv!34486 a!3931)))

(assert (=> start!117612 true))

(declare-fun bs!39908 () Bool)

(assert (= bs!39908 start!117612))

(declare-fun m!1266009 () Bool)

(assert (=> bs!39908 m!1266009))

(push 1)

(assert (not start!117612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

