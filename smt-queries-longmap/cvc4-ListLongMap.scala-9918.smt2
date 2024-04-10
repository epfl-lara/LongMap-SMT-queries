; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117280 () Bool)

(assert start!117280)

(declare-fun res!922092 () Bool)

(declare-fun e!781574 () Bool)

(assert (=> start!117280 (=> (not res!922092) (not e!781574))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93876 0))(
  ( (array!93877 (arr!45337 (Array (_ BitVec 32) (_ BitVec 64))) (size!45887 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93876)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117280 (= res!922092 (and (bvslt (size!45887 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45887 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117280 e!781574))

(declare-fun array_inv!34365 (array!93876) Bool)

(assert (=> start!117280 (array_inv!34365 a!4010)))

(assert (=> start!117280 true))

(declare-fun b!1379654 () Bool)

(declare-fun res!922093 () Bool)

(assert (=> b!1379654 (=> (not res!922093) (not e!781574))))

(declare-fun isPivot!0 (array!93876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379654 (= res!922093 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379655 () Bool)

(assert (=> b!1379655 (= e!781574 (not (bvsle pivot!64 (size!45887 a!4010))))))

(assert (=> b!1379655 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45883 0))(
  ( (Unit!45884) )
))
(declare-fun lt!607698 () Unit!45883)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93876 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45883)

(assert (=> b!1379655 (= lt!607698 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117280 res!922092) b!1379654))

(assert (= (and b!1379654 res!922093) b!1379655))

(declare-fun m!1264825 () Bool)

(assert (=> start!117280 m!1264825))

(declare-fun m!1264827 () Bool)

(assert (=> b!1379654 m!1264827))

(declare-fun m!1264829 () Bool)

(assert (=> b!1379655 m!1264829))

(declare-fun m!1264831 () Bool)

(assert (=> b!1379655 m!1264831))

(push 1)

(assert (not b!1379654))

(assert (not b!1379655))

(assert (not start!117280))

(check-sat)

(pop 1)

(push 1)

(check-sat)

