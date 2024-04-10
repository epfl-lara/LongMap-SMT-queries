; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117688 () Bool)

(assert start!117688)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94170 0))(
  ( (array!94171 (arr!45475 (Array (_ BitVec 32) (_ BitVec 64))) (size!46025 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94170)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117688 (and (bvslt (size!46025 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46025 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt pivot!39 (size!46025 a!3978)))))

(declare-fun array_inv!34503 (array!94170) Bool)

(assert (=> start!117688 (array_inv!34503 a!3978)))

(assert (=> start!117688 true))

(declare-fun bs!39931 () Bool)

(assert (= bs!39931 start!117688))

(declare-fun m!1266241 () Bool)

(assert (=> bs!39931 m!1266241))

(push 1)

(assert (not start!117688))

(check-sat)

(pop 1)

(push 1)

(check-sat)

