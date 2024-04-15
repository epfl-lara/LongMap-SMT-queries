; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117276 () Bool)

(assert start!117276)

(declare-fun res!922067 () Bool)

(declare-fun e!781542 () Bool)

(assert (=> start!117276 (=> (not res!922067) (not e!781542))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(declare-datatypes ((array!93826 0))(
  ( (array!93827 (arr!45312 (Array (_ BitVec 32) (_ BitVec 64))) (size!45864 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93826)

(assert (=> start!117276 (= res!922067 (and (bvslt (size!45864 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45864 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117276 e!781542))

(declare-fun array_inv!34545 (array!93826) Bool)

(assert (=> start!117276 (array_inv!34545 a!4010)))

(assert (=> start!117276 true))

(declare-fun b!1379585 () Bool)

(declare-fun res!922066 () Bool)

(assert (=> b!1379585 (=> (not res!922066) (not e!781542))))

(declare-fun isPivot!0 (array!93826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379585 (= res!922066 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379586 () Bool)

(assert (=> b!1379586 (= e!781542 (not (bvsle pivot!64 (size!45864 a!4010))))))

(assert (=> b!1379586 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45724 0))(
  ( (Unit!45725) )
))
(declare-fun lt!607514 () Unit!45724)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93826 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45724)

(assert (=> b!1379586 (= lt!607514 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117276 res!922067) b!1379585))

(assert (= (and b!1379585 res!922066) b!1379586))

(declare-fun m!1264321 () Bool)

(assert (=> start!117276 m!1264321))

(declare-fun m!1264323 () Bool)

(assert (=> b!1379585 m!1264323))

(declare-fun m!1264325 () Bool)

(assert (=> b!1379586 m!1264325))

(declare-fun m!1264327 () Bool)

(assert (=> b!1379586 m!1264327))

(push 1)

(assert (not start!117276))

(assert (not b!1379586))

(assert (not b!1379585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

