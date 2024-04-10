; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117292 () Bool)

(assert start!117292)

(declare-fun res!922129 () Bool)

(declare-fun e!781610 () Bool)

(assert (=> start!117292 (=> (not res!922129) (not e!781610))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93888 0))(
  ( (array!93889 (arr!45343 (Array (_ BitVec 32) (_ BitVec 64))) (size!45893 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93888)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117292 (= res!922129 (and (bvslt (size!45893 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45893 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117292 e!781610))

(declare-fun array_inv!34371 (array!93888) Bool)

(assert (=> start!117292 (array_inv!34371 a!4010)))

(assert (=> start!117292 true))

(declare-fun b!1379690 () Bool)

(declare-fun res!922128 () Bool)

(assert (=> b!1379690 (=> (not res!922128) (not e!781610))))

(declare-fun isPivot!0 (array!93888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379690 (= res!922128 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379691 () Bool)

(assert (=> b!1379691 (= e!781610 (not (bvsge pivot!64 #b00000000000000000000000000000000)))))

(assert (=> b!1379691 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45895 0))(
  ( (Unit!45896) )
))
(declare-fun lt!607716 () Unit!45895)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93888 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45895)

(assert (=> b!1379691 (= lt!607716 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117292 res!922129) b!1379690))

(assert (= (and b!1379690 res!922128) b!1379691))

(declare-fun m!1264873 () Bool)

(assert (=> start!117292 m!1264873))

(declare-fun m!1264875 () Bool)

(assert (=> b!1379690 m!1264875))

(declare-fun m!1264877 () Bool)

(assert (=> b!1379691 m!1264877))

(declare-fun m!1264879 () Bool)

(assert (=> b!1379691 m!1264879))

(push 1)

(assert (not b!1379690))

(assert (not b!1379691))

(assert (not start!117292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

