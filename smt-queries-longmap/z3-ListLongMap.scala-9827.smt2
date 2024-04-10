; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116650 () Bool)

(assert start!116650)

(declare-fun res!918148 () Bool)

(declare-fun e!778978 () Bool)

(assert (=> start!116650 (=> (not res!918148) (not e!778978))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93319 0))(
  ( (array!93320 (arr!45063 (Array (_ BitVec 32) (_ BitVec 64))) (size!45613 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93319)

(assert (=> start!116650 (= res!918148 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45613 a!4142))))))

(assert (=> start!116650 e!778978))

(assert (=> start!116650 true))

(declare-fun array_inv!34091 (array!93319) Bool)

(assert (=> start!116650 (array_inv!34091 a!4142)))

(declare-fun b!1375084 () Bool)

(assert (=> b!1375084 (= e!778978 (not true))))

(declare-fun lt!604025 () (_ BitVec 32))

(declare-fun lt!604028 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93319 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375084 (= (bvadd lt!604025 lt!604028) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45613 a!4142)))))

(declare-datatypes ((Unit!45515 0))(
  ( (Unit!45516) )
))
(declare-fun lt!604029 () Unit!45515)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93319 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45515)

(assert (=> b!1375084 (= lt!604029 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45613 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604026 () (_ BitVec 32))

(assert (=> b!1375084 (= lt!604026 lt!604028)))

(assert (=> b!1375084 (= lt!604028 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45613 a!4142)))))

(declare-fun lt!604027 () array!93319)

(assert (=> b!1375084 (= lt!604026 (arrayCountValidKeys!0 lt!604027 (bvadd #b00000000000000000000000000000001 i!1457) (size!45613 a!4142)))))

(declare-fun lt!604024 () Unit!45515)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45515)

(assert (=> b!1375084 (= lt!604024 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375084 (= (arrayCountValidKeys!0 lt!604027 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604025 #b00000000000000000000000000000001))))

(assert (=> b!1375084 (= lt!604025 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375084 (= lt!604027 (array!93320 (store (arr!45063 a!4142) i!1457 k0!2959) (size!45613 a!4142)))))

(declare-fun lt!604030 () Unit!45515)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93319 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45515)

(assert (=> b!1375084 (= lt!604030 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1375081 () Bool)

(declare-fun res!918147 () Bool)

(assert (=> b!1375081 (=> (not res!918147) (not e!778978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375081 (= res!918147 (validKeyInArray!0 (select (arr!45063 a!4142) i!1457)))))

(declare-fun b!1375082 () Bool)

(declare-fun res!918145 () Bool)

(assert (=> b!1375082 (=> (not res!918145) (not e!778978))))

(assert (=> b!1375082 (= res!918145 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1375083 () Bool)

(declare-fun res!918146 () Bool)

(assert (=> b!1375083 (=> (not res!918146) (not e!778978))))

(assert (=> b!1375083 (= res!918146 (bvslt (size!45613 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116650 res!918148) b!1375081))

(assert (= (and b!1375081 res!918147) b!1375082))

(assert (= (and b!1375082 res!918145) b!1375083))

(assert (= (and b!1375083 res!918146) b!1375084))

(declare-fun m!1258737 () Bool)

(assert (=> start!116650 m!1258737))

(declare-fun m!1258739 () Bool)

(assert (=> b!1375084 m!1258739))

(declare-fun m!1258741 () Bool)

(assert (=> b!1375084 m!1258741))

(declare-fun m!1258743 () Bool)

(assert (=> b!1375084 m!1258743))

(declare-fun m!1258745 () Bool)

(assert (=> b!1375084 m!1258745))

(declare-fun m!1258747 () Bool)

(assert (=> b!1375084 m!1258747))

(declare-fun m!1258749 () Bool)

(assert (=> b!1375084 m!1258749))

(declare-fun m!1258751 () Bool)

(assert (=> b!1375084 m!1258751))

(declare-fun m!1258753 () Bool)

(assert (=> b!1375084 m!1258753))

(declare-fun m!1258755 () Bool)

(assert (=> b!1375084 m!1258755))

(declare-fun m!1258757 () Bool)

(assert (=> b!1375081 m!1258757))

(assert (=> b!1375081 m!1258757))

(declare-fun m!1258759 () Bool)

(assert (=> b!1375081 m!1258759))

(declare-fun m!1258761 () Bool)

(assert (=> b!1375082 m!1258761))

(check-sat (not b!1375084) (not b!1375082) (not start!116650) (not b!1375081))
