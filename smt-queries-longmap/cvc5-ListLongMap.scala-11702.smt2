; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136832 () Bool)

(assert start!136832)

(declare-fun from!2846 () (_ BitVec 32))

(declare-datatypes ((array!105821 0))(
  ( (array!105822 (arr!51019 (Array (_ BitVec 32) (_ BitVec 64))) (size!51569 (_ BitVec 32))) )
))
(declare-fun a!3471 () array!105821)

(declare-fun k!2737 () (_ BitVec 64))

(assert (=> start!136832 (and (bvsge from!2846 #b00000000000000000000000000000000) (bvslt from!2846 (size!51569 a!3471)) (bvslt (size!51569 a!3471) #b01111111111111111111111111111111) (not (= (select (arr!51019 a!3471) from!2846) k!2737)) (bvslt (bvadd #b00000000000000000000000000000001 from!2846) (size!51569 a!3471)) (bvsge (bvsub (size!51569 a!3471) (bvadd #b00000000000000000000000000000001 from!2846)) (bvsub (size!51569 a!3471) from!2846)))))

(assert (=> start!136832 true))

(declare-fun array_inv!39746 (array!105821) Bool)

(assert (=> start!136832 (array_inv!39746 a!3471)))

(declare-fun bs!45711 () Bool)

(assert (= bs!45711 start!136832))

(declare-fun m!1450861 () Bool)

(assert (=> bs!45711 m!1450861))

(declare-fun m!1450863 () Bool)

(assert (=> bs!45711 m!1450863))

(push 1)

(assert (not start!136832))

(check-sat)

(pop 1)

(push 1)

(check-sat)

