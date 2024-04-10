; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117690 () Bool)

(assert start!117690)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94172 0))(
  ( (array!94173 (arr!45476 (Array (_ BitVec 32) (_ BitVec 64))) (size!46026 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94172)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117690 (and (bvslt (size!46026 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46026 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (or (bvsgt pivot!39 to!152) (bvslt pivot!39 #b00000000000000000000000000000000)))))

(declare-fun array_inv!34504 (array!94172) Bool)

(assert (=> start!117690 (array_inv!34504 a!3978)))

(assert (=> start!117690 true))

(declare-fun bs!39935 () Bool)

(assert (= bs!39935 start!117690))

(declare-fun m!1266243 () Bool)

(assert (=> bs!39935 m!1266243))

(push 1)

(assert (not start!117690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

