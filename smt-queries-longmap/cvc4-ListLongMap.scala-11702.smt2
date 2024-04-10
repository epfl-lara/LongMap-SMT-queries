; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136836 () Bool)

(assert start!136836)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105825 0))(
  ( (array!105826 (arr!51021 (Array (_ BitVec 32) (_ BitVec 64))) (size!51571 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105825)

(declare-fun k!2737 () (_ BitVec 64))

(assert (=> start!136836 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51571 a!3471)) (bvslt (size!51571 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51021 a!3471) from!2846) k!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51571 a!3471)) (bvsge (bvsub (size!51571 a!3471) (bvadd #b00000000000000000000000000000001 from!2846)) (bvsub (size!51571 a!3471) from!2846)))))

(assert (=> start!136836 true))

(declare-fun array_inv!39748 (array!105825) Bool)

(assert (=> start!136836 (array_inv!39748 a!3471)))

(declare-fun bs!45713 () Bool)

(assert (= bs!45713 start!136836))

(declare-fun m!1450869 () Bool)

(assert (=> bs!45713 m!1450869))

(declare-fun m!1450871 () Bool)

(assert (=> bs!45713 m!1450871))

(push 1)

(assert (not start!136836))

(check-sat)

(pop 1)

(push 1)

(check-sat)

