; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136830 () Bool)

(assert start!136830)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105819 0))(
  ( (array!105820 (arr!51018 (Array (_ BitVec 32) (_ BitVec 64))) (size!51568 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105819)

(assert (=> start!136830 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51568 a!3471)) (bvslt (size!51568 a!3471) #b01111111111111111111111111111111) (bvslt (bvsub (size!51568 a!3471) from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136830 true))

(declare-fun array_inv!39745 (array!105819) Bool)

(assert (=> start!136830 (array_inv!39745 a!3471)))

(declare-fun bs!45707 () Bool)

(assert (= bs!45707 start!136830))

(declare-fun m!1450859 () Bool)

(assert (=> bs!45707 m!1450859))

(push 1)

(assert (not start!136830))

(check-sat)

(pop 1)

(push 1)

(check-sat)

