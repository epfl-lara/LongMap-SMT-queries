; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117484 () Bool)

(assert start!117484)

(declare-fun res!922515 () Bool)

(declare-fun e!782107 () Bool)

(assert (=> start!117484 (=> (not res!922515) (not e!782107))))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94035 0))(
  ( (array!94036 (arr!45412 (Array (_ BitVec 32) (_ BitVec 64))) (size!45962 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94035)

(declare-fun to!135 () (_ BitVec 32))

(declare-fun from!3339 () (_ BitVec 32))

(assert (=> start!117484 (= res!922515 (and (bvslt (size!45962 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45962 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117484 e!782107))

(declare-fun array_inv!34440 (array!94035) Bool)

(assert (=> start!117484 (array_inv!34440 a!3961)))

(assert (=> start!117484 true))

(declare-fun b!1380263 () Bool)

(declare-fun res!922516 () Bool)

(assert (=> b!1380263 (=> (not res!922516) (not e!782107))))

(declare-fun isPivot!0 (array!94035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380263 (= res!922516 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380264 () Bool)

(assert (=> b!1380264 (= e!782107 (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) (size!45962 a!3961)))))

(assert (= (and start!117484 res!922515) b!1380263))

(assert (= (and b!1380263 res!922516) b!1380264))

(declare-fun m!1265459 () Bool)

(assert (=> start!117484 m!1265459))

(declare-fun m!1265461 () Bool)

(assert (=> b!1380263 m!1265461))

(push 1)

(assert (not b!1380263))

(assert (not start!117484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

