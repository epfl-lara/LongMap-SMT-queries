; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117714 () Bool)

(assert start!117714)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94196 0))(
  ( (array!94197 (arr!45488 (Array (_ BitVec 32) (_ BitVec 64))) (size!46038 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94196)

(assert (=> start!117714 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46038 a!3464)) (bvslt (size!46038 a!3464) #b01111111111111111111111111111111) (bvslt (bvsub (size!46038 a!3464) from!2839) #b00000000000000000000000000000000))))

(assert (=> start!117714 true))

(declare-fun array_inv!34516 (array!94196) Bool)

(assert (=> start!117714 (array_inv!34516 a!3464)))

(declare-fun bs!39953 () Bool)

(assert (= bs!39953 start!117714))

(declare-fun m!1266291 () Bool)

(assert (=> bs!39953 m!1266291))

(push 1)

(assert (not start!117714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

