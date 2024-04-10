; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116670 () Bool)

(assert start!116670)

(declare-fun b!1375218 () Bool)

(declare-fun e!779054 () Bool)

(declare-fun lt!604291 () (_ BitVec 32))

(declare-fun lt!604287 () (_ BitVec 32))

(assert (=> b!1375218 (= e!779054 (= lt!604291 (bvsub lt!604287 #b00000000000000000000000000000001)))))

(declare-fun lt!604286 () (_ BitVec 32))

(declare-fun lt!604293 () (_ BitVec 32))

(assert (=> b!1375218 (= (bvadd lt!604286 lt!604293) lt!604291)))

(declare-datatypes ((array!93339 0))(
  ( (array!93340 (arr!45073 (Array (_ BitVec 32) (_ BitVec 64))) (size!45623 (_ BitVec 32))) )
))
(declare-fun lt!604294 () array!93339)

(declare-fun a!4142 () array!93339)

(declare-fun arrayCountValidKeys!0 (array!93339 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375218 (= lt!604291 (arrayCountValidKeys!0 lt!604294 #b00000000000000000000000000000000 (size!45623 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45535 0))(
  ( (Unit!45536) )
))
(declare-fun lt!604289 () Unit!45535)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45535)

(assert (=> b!1375218 (= lt!604289 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604294 #b00000000000000000000000000000000 (size!45623 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1375219 () Bool)

(declare-fun res!918283 () Bool)

(declare-fun e!779056 () Bool)

(assert (=> b!1375219 (=> (not res!918283) (not e!779056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375219 (= res!918283 (validKeyInArray!0 (select (arr!45073 a!4142) i!1457)))))

(declare-fun b!1375220 () Bool)

(declare-fun res!918282 () Bool)

(assert (=> b!1375220 (=> (not res!918282) (not e!779056))))

(assert (=> b!1375220 (= res!918282 (bvslt (size!45623 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375221 () Bool)

(assert (=> b!1375221 (= e!779056 (not e!779054))))

(declare-fun res!918286 () Bool)

(assert (=> b!1375221 (=> res!918286 e!779054)))

(assert (=> b!1375221 (= res!918286 (or (bvslt (size!45623 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604288 () (_ BitVec 32))

(declare-fun lt!604290 () (_ BitVec 32))

(assert (=> b!1375221 (= (bvadd lt!604288 lt!604290) lt!604287)))

(assert (=> b!1375221 (= lt!604287 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45623 a!4142)))))

(declare-fun lt!604285 () Unit!45535)

(assert (=> b!1375221 (= lt!604285 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45623 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375221 (= lt!604293 lt!604290)))

(assert (=> b!1375221 (= lt!604290 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45623 a!4142)))))

(assert (=> b!1375221 (= lt!604293 (arrayCountValidKeys!0 lt!604294 (bvadd #b00000000000000000000000000000001 i!1457) (size!45623 a!4142)))))

(declare-fun lt!604292 () Unit!45535)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45535)

(assert (=> b!1375221 (= lt!604292 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375221 (= lt!604286 (bvsub lt!604288 #b00000000000000000000000000000001))))

(assert (=> b!1375221 (= lt!604286 (arrayCountValidKeys!0 lt!604294 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375221 (= lt!604288 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375221 (= lt!604294 (array!93340 (store (arr!45073 a!4142) i!1457 k!2959) (size!45623 a!4142)))))

(declare-fun lt!604284 () Unit!45535)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93339 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45535)

(assert (=> b!1375221 (= lt!604284 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375222 () Bool)

(declare-fun res!918285 () Bool)

(assert (=> b!1375222 (=> (not res!918285) (not e!779056))))

(assert (=> b!1375222 (= res!918285 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!918284 () Bool)

(assert (=> start!116670 (=> (not res!918284) (not e!779056))))

(assert (=> start!116670 (= res!918284 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45623 a!4142))))))

(assert (=> start!116670 e!779056))

(assert (=> start!116670 true))

(declare-fun array_inv!34101 (array!93339) Bool)

(assert (=> start!116670 (array_inv!34101 a!4142)))

(assert (= (and start!116670 res!918284) b!1375219))

(assert (= (and b!1375219 res!918283) b!1375222))

(assert (= (and b!1375222 res!918285) b!1375220))

(assert (= (and b!1375220 res!918282) b!1375221))

(assert (= (and b!1375221 (not res!918286)) b!1375218))

(declare-fun m!1259017 () Bool)

(assert (=> b!1375219 m!1259017))

(assert (=> b!1375219 m!1259017))

(declare-fun m!1259019 () Bool)

(assert (=> b!1375219 m!1259019))

(declare-fun m!1259021 () Bool)

(assert (=> start!116670 m!1259021))

(declare-fun m!1259023 () Bool)

(assert (=> b!1375218 m!1259023))

(declare-fun m!1259025 () Bool)

(assert (=> b!1375218 m!1259025))

(declare-fun m!1259027 () Bool)

(assert (=> b!1375222 m!1259027))

(declare-fun m!1259029 () Bool)

(assert (=> b!1375221 m!1259029))

(declare-fun m!1259031 () Bool)

(assert (=> b!1375221 m!1259031))

(declare-fun m!1259033 () Bool)

(assert (=> b!1375221 m!1259033))

(declare-fun m!1259035 () Bool)

(assert (=> b!1375221 m!1259035))

(declare-fun m!1259037 () Bool)

(assert (=> b!1375221 m!1259037))

(declare-fun m!1259039 () Bool)

(assert (=> b!1375221 m!1259039))

(declare-fun m!1259041 () Bool)

(assert (=> b!1375221 m!1259041))

(declare-fun m!1259043 () Bool)

(assert (=> b!1375221 m!1259043))

(declare-fun m!1259045 () Bool)

(assert (=> b!1375221 m!1259045))

(push 1)

(assert (not b!1375219))

(assert (not start!116670))

(assert (not b!1375222))

(assert (not b!1375221))

(assert (not b!1375218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

