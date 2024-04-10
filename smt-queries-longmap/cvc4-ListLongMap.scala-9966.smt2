; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117700 () Bool)

(assert start!117700)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94182 0))(
  ( (array!94183 (arr!45481 (Array (_ BitVec 32) (_ BitVec 64))) (size!46031 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94182)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117700 (and (bvslt (size!46031 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46031 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt from!3356 to!152))))

(declare-fun array_inv!34509 (array!94182) Bool)

(assert (=> start!117700 (array_inv!34509 a!3978)))

(assert (=> start!117700 true))

(declare-fun bs!39943 () Bool)

(assert (= bs!39943 start!117700))

(declare-fun m!1266253 () Bool)

(assert (=> bs!39943 m!1266253))

(push 1)

(assert (not start!117700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

