; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117294 () Bool)

(assert start!117294)

(declare-fun res!922134 () Bool)

(declare-fun e!781615 () Bool)

(assert (=> start!117294 (=> (not res!922134) (not e!781615))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93890 0))(
  ( (array!93891 (arr!45344 (Array (_ BitVec 32) (_ BitVec 64))) (size!45894 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93890)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117294 (= res!922134 (and (bvslt (size!45894 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45894 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117294 e!781615))

(declare-fun array_inv!34372 (array!93890) Bool)

(assert (=> start!117294 (array_inv!34372 a!4010)))

(assert (=> start!117294 true))

(declare-fun b!1379696 () Bool)

(declare-fun res!922135 () Bool)

(assert (=> b!1379696 (=> (not res!922135) (not e!781615))))

(declare-fun isPivot!0 (array!93890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379696 (= res!922135 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379697 () Bool)

(assert (=> b!1379697 (= e!781615 (not true))))

(assert (=> b!1379697 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45897 0))(
  ( (Unit!45898) )
))
(declare-fun lt!607719 () Unit!45897)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93890 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45897)

(assert (=> b!1379697 (= lt!607719 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117294 res!922134) b!1379696))

(assert (= (and b!1379696 res!922135) b!1379697))

(declare-fun m!1264881 () Bool)

(assert (=> start!117294 m!1264881))

(declare-fun m!1264883 () Bool)

(assert (=> b!1379696 m!1264883))

(declare-fun m!1264885 () Bool)

(assert (=> b!1379697 m!1264885))

(declare-fun m!1264887 () Bool)

(assert (=> b!1379697 m!1264887))

(push 1)

(assert (not start!117294))

(assert (not b!1379697))

(assert (not b!1379696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

