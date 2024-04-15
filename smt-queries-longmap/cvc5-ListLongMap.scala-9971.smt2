; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117726 () Bool)

(assert start!117726)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94162 0))(
  ( (array!94163 (arr!45471 (Array (_ BitVec 32) (_ BitVec 64))) (size!46023 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94162)

(assert (=> start!117726 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46023 a!3464)) (bvslt (size!46023 a!3464) #b01111111111111111111111111111111) (bvslt from!2839 to!94) (bvsge from!2839 (size!46023 a!3464)))))

(assert (=> start!117726 true))

(declare-fun array_inv!34704 (array!94162) Bool)

(assert (=> start!117726 (array_inv!34704 a!3464)))

(declare-fun bs!39939 () Bool)

(assert (= bs!39939 start!117726))

(declare-fun m!1265803 () Bool)

(assert (=> bs!39939 m!1265803))

(push 1)

(assert (not start!117726))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

