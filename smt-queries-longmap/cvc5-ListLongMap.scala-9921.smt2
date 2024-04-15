; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117294 () Bool)

(assert start!117294)

(declare-fun res!922120 () Bool)

(declare-fun e!781597 () Bool)

(assert (=> start!117294 (=> (not res!922120) (not e!781597))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93844 0))(
  ( (array!93845 (arr!45321 (Array (_ BitVec 32) (_ BitVec 64))) (size!45873 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93844)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117294 (= res!922120 (and (bvslt (size!45873 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45873 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117294 e!781597))

(declare-fun array_inv!34554 (array!93844) Bool)

(assert (=> start!117294 (array_inv!34554 a!4010)))

(assert (=> start!117294 true))

(declare-fun b!1379639 () Bool)

(declare-fun res!922121 () Bool)

(assert (=> b!1379639 (=> (not res!922121) (not e!781597))))

(declare-fun isPivot!0 (array!93844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379639 (= res!922121 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379640 () Bool)

(assert (=> b!1379640 (= e!781597 (not true))))

(assert (=> b!1379640 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45742 0))(
  ( (Unit!45743) )
))
(declare-fun lt!607541 () Unit!45742)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45742)

(assert (=> b!1379640 (= lt!607541 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117294 res!922120) b!1379639))

(assert (= (and b!1379639 res!922121) b!1379640))

(declare-fun m!1264393 () Bool)

(assert (=> start!117294 m!1264393))

(declare-fun m!1264395 () Bool)

(assert (=> b!1379639 m!1264395))

(declare-fun m!1264397 () Bool)

(assert (=> b!1379640 m!1264397))

(declare-fun m!1264399 () Bool)

(assert (=> b!1379640 m!1264399))

(push 1)

(assert (not b!1379639))

(assert (not b!1379640))

(assert (not start!117294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

