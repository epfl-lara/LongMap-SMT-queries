; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117724 () Bool)

(assert start!117724)

(declare-fun from!2839 () (_ BitVec 32))

(declare-fun to!94 () (_ BitVec 32))

(declare-datatypes ((array!94206 0))(
  ( (array!94207 (arr!45493 (Array (_ BitVec 32) (_ BitVec 64))) (size!46043 (_ BitVec 32))) )
))
(declare-fun a!3464 () array!94206)

(assert (=> start!117724 (and (bvsle from!2839 to!94) (bvsge from!2839 #b00000000000000000000000000000000) (bvsle to!94 (size!46043 a!3464)) (bvslt (size!46043 a!3464) #b01111111111111111111111111111111) (bvsge from!2839 to!94) (bvsgt #b00000000000000000000000000000000 (bvsub (size!46043 a!3464) from!2839)))))

(assert (=> start!117724 true))

(declare-fun array_inv!34521 (array!94206) Bool)

(assert (=> start!117724 (array_inv!34521 a!3464)))

(declare-fun bs!39961 () Bool)

(assert (= bs!39961 start!117724))

(declare-fun m!1266301 () Bool)

(assert (=> bs!39961 m!1266301))

(push 1)

(assert (not start!117724))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

