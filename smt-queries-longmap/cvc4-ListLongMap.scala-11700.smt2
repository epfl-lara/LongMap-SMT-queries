; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136824 () Bool)

(assert start!136824)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105813 0))(
  ( (array!105814 (arr!51015 (Array (_ BitVec 32) (_ BitVec 64))) (size!51565 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105813)

(declare-fun k!2737 () (_ BitVec 64))

(assert (=> start!136824 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51565 a!3471)) (bvslt (size!51565 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51015 a!3471) from!2846) k!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51565 a!3471)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) #b00000000000000000000000000000000))))

(assert (=> start!136824 true))

(declare-fun array_inv!39742 (array!105813) Bool)

(assert (=> start!136824 (array_inv!39742 a!3471)))

(declare-fun bs!45701 () Bool)

(assert (= bs!45701 start!136824))

(declare-fun m!1450851 () Bool)

(assert (=> bs!45701 m!1450851))

(declare-fun m!1450853 () Bool)

(assert (=> bs!45701 m!1450853))

(push 1)

(assert (not start!136824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

