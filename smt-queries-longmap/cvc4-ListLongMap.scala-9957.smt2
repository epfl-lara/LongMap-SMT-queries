; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117604 () Bool)

(assert start!117604)

(declare-datatypes ((array!94122 0))(
  ( (array!94123 (arr!45454 (Array (_ BitVec 32) (_ BitVec 64))) (size!46004 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94122)

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun to!105 () (_ BitVec 32))

(assert (=> start!117604 (and (bvslt (size!46004 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46004 a!3931)) (bvslt (bvsub to!105 from!3309) #b00000000000000000000000000000000))))

(declare-fun array_inv!34482 (array!94122) Bool)

(assert (=> start!117604 (array_inv!34482 a!3931)))

(assert (=> start!117604 true))

(declare-fun bs!39898 () Bool)

(assert (= bs!39898 start!117604))

(declare-fun m!1266001 () Bool)

(assert (=> bs!39898 m!1266001))

(push 1)

(assert (not start!117604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

