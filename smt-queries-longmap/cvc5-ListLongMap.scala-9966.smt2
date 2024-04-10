; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117696 () Bool)

(assert start!117696)

(declare-fun pivot!39 () (_ BitVec 32))

(declare-fun from!3356 () (_ BitVec 32))

(declare-datatypes ((array!94178 0))(
  ( (array!94179 (arr!45479 (Array (_ BitVec 32) (_ BitVec 64))) (size!46029 (_ BitVec 32))) )
))
(declare-fun a!3978 () array!94178)

(declare-fun to!152 () (_ BitVec 32))

(assert (=> start!117696 (and (bvslt (size!46029 a!3978) #b01111111111111111111111111111111) (bvsge from!3356 #b00000000000000000000000000000000) (bvsgt to!152 from!3356) (bvsle to!152 (size!46029 a!3978)) (bvsge pivot!39 from!3356) (bvslt pivot!39 to!152) (bvsgt from!3356 to!152))))

(declare-fun array_inv!34507 (array!94178) Bool)

(assert (=> start!117696 (array_inv!34507 a!3978)))

(assert (=> start!117696 true))

(declare-fun bs!39941 () Bool)

(assert (= bs!39941 start!117696))

(declare-fun m!1266249 () Bool)

(assert (=> bs!39941 m!1266249))

(push 1)

(assert (not start!117696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

