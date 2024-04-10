; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117480 () Bool)

(assert start!117480)

(declare-fun res!922503 () Bool)

(declare-fun e!782095 () Bool)

(assert (=> start!117480 (=> (not res!922503) (not e!782095))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94031 0))(
  ( (array!94032 (arr!45410 (Array (_ BitVec 32) (_ BitVec 64))) (size!45960 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94031)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117480 (= res!922503 (and (bvslt (size!45960 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45960 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117480 e!782095))

(declare-fun array_inv!34438 (array!94031) Bool)

(assert (=> start!117480 (array_inv!34438 a!3961)))

(assert (=> start!117480 true))

(declare-fun b!1380251 () Bool)

(declare-fun res!922504 () Bool)

(assert (=> b!1380251 (=> (not res!922504) (not e!782095))))

(declare-fun isPivot!0 (array!94031 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380251 (= res!922504 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380252 () Bool)

(assert (=> b!1380252 (= e!782095 (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) (size!45960 a!3961)))))

(assert (= (and start!117480 res!922503) b!1380251))

(assert (= (and b!1380251 res!922504) b!1380252))

(declare-fun m!1265451 () Bool)

(assert (=> start!117480 m!1265451))

(declare-fun m!1265453 () Bool)

(assert (=> b!1380251 m!1265453))

(push 1)

(assert (not b!1380251))

(assert (not start!117480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

