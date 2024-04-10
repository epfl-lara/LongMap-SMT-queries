; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136826 () Bool)

(assert start!136826)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105815 0))(
  ( (array!105816 (arr!51016 (Array (_ BitVec 32) (_ BitVec 64))) (size!51566 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105815)

(assert (=> start!136826 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51566 a!3471)) (bvslt (size!51566 a!3471) #b01111111111111111111111111111111) (bvslt (bvsub (size!51566 a!3471) from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136826 true))

(declare-fun array_inv!39743 (array!105815) Bool)

(assert (=> start!136826 (array_inv!39743 a!3471)))

(declare-fun bs!45705 () Bool)

(assert (= bs!45705 start!136826))

(declare-fun m!1450855 () Bool)

(assert (=> bs!45705 m!1450855))

(push 1)

(assert (not start!136826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

