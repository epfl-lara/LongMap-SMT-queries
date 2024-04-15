; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116666 () Bool)

(assert start!116666)

(declare-fun b!1375157 () Bool)

(declare-fun res!918260 () Bool)

(declare-fun e!779028 () Bool)

(assert (=> b!1375157 (=> (not res!918260) (not e!779028))))

(declare-datatypes ((array!93289 0))(
  ( (array!93290 (arr!45048 (Array (_ BitVec 32) (_ BitVec 64))) (size!45600 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93289)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375157 (= res!918260 (validKeyInArray!0 (select (arr!45048 a!4142) i!1457)))))

(declare-fun b!1375158 () Bool)

(declare-fun res!918257 () Bool)

(assert (=> b!1375158 (=> (not res!918257) (not e!779028))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1375158 (= res!918257 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375159 () Bool)

(declare-fun res!918258 () Bool)

(assert (=> b!1375159 (=> (not res!918258) (not e!779028))))

(assert (=> b!1375159 (= res!918258 (bvslt (size!45600 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375160 () Bool)

(declare-fun e!779027 () Bool)

(assert (=> b!1375160 (= e!779028 (not e!779027))))

(declare-fun res!918256 () Bool)

(assert (=> b!1375160 (=> res!918256 e!779027)))

(assert (=> b!1375160 (= res!918256 (or (bvslt (size!45600 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604112 () (_ BitVec 32))

(declare-fun lt!604103 () (_ BitVec 32))

(declare-fun lt!604108 () (_ BitVec 32))

(assert (=> b!1375160 (= (bvadd lt!604112 lt!604103) lt!604108)))

(declare-fun arrayCountValidKeys!0 (array!93289 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375160 (= lt!604108 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45600 a!4142)))))

(declare-datatypes ((Unit!45376 0))(
  ( (Unit!45377) )
))
(declare-fun lt!604104 () Unit!45376)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45376)

(assert (=> b!1375160 (= lt!604104 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45600 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604105 () (_ BitVec 32))

(assert (=> b!1375160 (= lt!604105 lt!604103)))

(assert (=> b!1375160 (= lt!604103 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45600 a!4142)))))

(declare-fun lt!604111 () array!93289)

(assert (=> b!1375160 (= lt!604105 (arrayCountValidKeys!0 lt!604111 (bvadd #b00000000000000000000000000000001 i!1457) (size!45600 a!4142)))))

(declare-fun lt!604109 () Unit!45376)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45376)

(assert (=> b!1375160 (= lt!604109 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604107 () (_ BitVec 32))

(assert (=> b!1375160 (= lt!604107 (bvsub lt!604112 #b00000000000000000000000000000001))))

(assert (=> b!1375160 (= lt!604107 (arrayCountValidKeys!0 lt!604111 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604112 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375160 (= lt!604111 (array!93290 (store (arr!45048 a!4142) i!1457 k!2959) (size!45600 a!4142)))))

(declare-fun lt!604102 () Unit!45376)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93289 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45376)

(assert (=> b!1375160 (= lt!604102 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375161 () Bool)

(declare-fun lt!604110 () (_ BitVec 32))

(assert (=> b!1375161 (= e!779027 (= lt!604110 (bvsub lt!604108 #b00000000000000000000000000000001)))))

(assert (=> b!1375161 (= (bvadd lt!604107 lt!604105) lt!604110)))

(assert (=> b!1375161 (= lt!604110 (arrayCountValidKeys!0 lt!604111 #b00000000000000000000000000000000 (size!45600 a!4142)))))

(declare-fun lt!604106 () Unit!45376)

(assert (=> b!1375161 (= lt!604106 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604111 #b00000000000000000000000000000000 (size!45600 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!918259 () Bool)

(assert (=> start!116666 (=> (not res!918259) (not e!779028))))

(assert (=> start!116666 (= res!918259 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45600 a!4142))))))

(assert (=> start!116666 e!779028))

(assert (=> start!116666 true))

(declare-fun array_inv!34281 (array!93289) Bool)

(assert (=> start!116666 (array_inv!34281 a!4142)))

(assert (= (and start!116666 res!918259) b!1375157))

(assert (= (and b!1375157 res!918260) b!1375158))

(assert (= (and b!1375158 res!918257) b!1375159))

(assert (= (and b!1375159 res!918258) b!1375160))

(assert (= (and b!1375160 (not res!918256)) b!1375161))

(declare-fun m!1258515 () Bool)

(assert (=> b!1375158 m!1258515))

(declare-fun m!1258517 () Bool)

(assert (=> b!1375157 m!1258517))

(assert (=> b!1375157 m!1258517))

(declare-fun m!1258519 () Bool)

(assert (=> b!1375157 m!1258519))

(declare-fun m!1258521 () Bool)

(assert (=> b!1375160 m!1258521))

(declare-fun m!1258523 () Bool)

(assert (=> b!1375160 m!1258523))

(declare-fun m!1258525 () Bool)

(assert (=> b!1375160 m!1258525))

(declare-fun m!1258527 () Bool)

(assert (=> b!1375160 m!1258527))

(declare-fun m!1258529 () Bool)

(assert (=> b!1375160 m!1258529))

(declare-fun m!1258531 () Bool)

(assert (=> b!1375160 m!1258531))

(declare-fun m!1258533 () Bool)

(assert (=> b!1375160 m!1258533))

(declare-fun m!1258535 () Bool)

(assert (=> b!1375160 m!1258535))

(declare-fun m!1258537 () Bool)

(assert (=> b!1375160 m!1258537))

(declare-fun m!1258539 () Bool)

(assert (=> start!116666 m!1258539))

(declare-fun m!1258541 () Bool)

(assert (=> b!1375161 m!1258541))

(declare-fun m!1258543 () Bool)

(assert (=> b!1375161 m!1258543))

(push 1)

(assert (not start!116666))

(assert (not b!1375157))

(assert (not b!1375161))

(assert (not b!1375158))

(assert (not b!1375160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

