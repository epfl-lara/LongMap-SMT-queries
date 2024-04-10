; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117718 () Bool)

(assert start!117718)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94200 0))(
  ( (array!94201 (arr!45490 (Array (_ BitVec 32) (_ BitVec 64))) (size!46040 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94200)

(assert (=> start!117718 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46040 a!3464)) (bvslt (size!46040 a!3464) #b01111111111111111111111111111111) (bvslt (bvsub (size!46040 a!3464) from!2839) #b00000000000000000000000000000000))))

(assert (=> start!117718 true))

(declare-fun array_inv!34518 (array!94200) Bool)

(assert (=> start!117718 (array_inv!34518 a!3464)))

(declare-fun bs!39955 () Bool)

(assert (= bs!39955 start!117718))

(declare-fun m!1266295 () Bool)

(assert (=> bs!39955 m!1266295))

(push 1)

(assert (not start!117718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

