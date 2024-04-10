; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117726 () Bool)

(assert start!117726)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94208 0))(
  ( (array!94209 (arr!45494 (Array (_ BitVec 32) (_ BitVec 64))) (size!46044 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94208)

(assert (=> start!117726 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46044 a!3464)) (bvslt (size!46044 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94) (bvsge from!2839 (size!46044 a!3464)))))

(assert (=> start!117726 true))

(declare-fun array_inv!34522 (array!94208) Bool)

(assert (=> start!117726 (array_inv!34522 a!3464)))

(declare-fun bs!39965 () Bool)

(assert (= bs!39965 start!117726))

(declare-fun m!1266303 () Bool)

(assert (=> bs!39965 m!1266303))

(push 1)

(assert (not start!117726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

