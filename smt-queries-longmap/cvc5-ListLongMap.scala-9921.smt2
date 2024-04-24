; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117530 () Bool)

(assert start!117530)

(declare-fun res!922667 () Bool)

(declare-fun e!782477 () Bool)

(assert (=> start!117530 (=> (not res!922667) (not e!782477))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94010 0))(
  ( (array!94011 (arr!45399 (Array (_ BitVec 32) (_ BitVec 64))) (size!45950 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94010)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117530 (= res!922667 (and (bvslt (size!45950 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45950 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117530 e!782477))

(declare-fun array_inv!34680 (array!94010) Bool)

(assert (=> start!117530 (array_inv!34680 a!4010)))

(assert (=> start!117530 true))

(declare-fun b!1381018 () Bool)

(declare-fun res!922668 () Bool)

(assert (=> b!1381018 (=> (not res!922668) (not e!782477))))

(declare-fun isPivot!0 (array!94010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381018 (= res!922668 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1381019 () Bool)

(assert (=> b!1381019 (= e!782477 (not true))))

(assert (=> b!1381019 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45840 0))(
  ( (Unit!45841) )
))
(declare-fun lt!608206 () Unit!45840)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94010 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45840)

(assert (=> b!1381019 (= lt!608206 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117530 res!922667) b!1381018))

(assert (= (and b!1381018 res!922668) b!1381019))

(declare-fun m!1266533 () Bool)

(assert (=> start!117530 m!1266533))

(declare-fun m!1266535 () Bool)

(assert (=> b!1381018 m!1266535))

(declare-fun m!1266537 () Bool)

(assert (=> b!1381019 m!1266537))

(declare-fun m!1266539 () Bool)

(assert (=> b!1381019 m!1266539))

(push 1)

(assert (not b!1381018))

(assert (not b!1381019))

(assert (not start!117530))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

