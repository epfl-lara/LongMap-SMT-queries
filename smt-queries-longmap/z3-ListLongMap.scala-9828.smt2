; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116656 () Bool)

(assert start!116656)

(declare-fun res!918183 () Bool)

(declare-fun e!778996 () Bool)

(assert (=> start!116656 (=> (not res!918183) (not e!778996))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93325 0))(
  ( (array!93326 (arr!45066 (Array (_ BitVec 32) (_ BitVec 64))) (size!45616 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93325)

(assert (=> start!116656 (= res!918183 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45616 a!4142))))))

(assert (=> start!116656 e!778996))

(assert (=> start!116656 true))

(declare-fun array_inv!34094 (array!93325) Bool)

(assert (=> start!116656 (array_inv!34094 a!4142)))

(declare-fun b!1375117 () Bool)

(declare-fun res!918182 () Bool)

(assert (=> b!1375117 (=> (not res!918182) (not e!778996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375117 (= res!918182 (validKeyInArray!0 (select (arr!45066 a!4142) i!1457)))))

(declare-fun b!1375120 () Bool)

(assert (=> b!1375120 (= e!778996 (not (and (bvsge (size!45616 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!604088 () (_ BitVec 32))

(declare-fun lt!604090 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93325 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375120 (= (bvadd lt!604088 lt!604090) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45616 a!4142)))))

(declare-datatypes ((Unit!45521 0))(
  ( (Unit!45522) )
))
(declare-fun lt!604087 () Unit!45521)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93325 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45521)

(assert (=> b!1375120 (= lt!604087 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45616 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604091 () (_ BitVec 32))

(assert (=> b!1375120 (= lt!604091 lt!604090)))

(assert (=> b!1375120 (= lt!604090 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45616 a!4142)))))

(declare-fun lt!604092 () array!93325)

(assert (=> b!1375120 (= lt!604091 (arrayCountValidKeys!0 lt!604092 (bvadd #b00000000000000000000000000000001 i!1457) (size!45616 a!4142)))))

(declare-fun lt!604093 () Unit!45521)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45521)

(assert (=> b!1375120 (= lt!604093 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375120 (= (arrayCountValidKeys!0 lt!604092 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604088 #b00000000000000000000000000000001))))

(assert (=> b!1375120 (= lt!604088 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375120 (= lt!604092 (array!93326 (store (arr!45066 a!4142) i!1457 k0!2959) (size!45616 a!4142)))))

(declare-fun lt!604089 () Unit!45521)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93325 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45521)

(assert (=> b!1375120 (= lt!604089 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1375118 () Bool)

(declare-fun res!918184 () Bool)

(assert (=> b!1375118 (=> (not res!918184) (not e!778996))))

(assert (=> b!1375118 (= res!918184 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1375119 () Bool)

(declare-fun res!918181 () Bool)

(assert (=> b!1375119 (=> (not res!918181) (not e!778996))))

(assert (=> b!1375119 (= res!918181 (bvslt (size!45616 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116656 res!918183) b!1375117))

(assert (= (and b!1375117 res!918182) b!1375118))

(assert (= (and b!1375118 res!918184) b!1375119))

(assert (= (and b!1375119 res!918181) b!1375120))

(declare-fun m!1258815 () Bool)

(assert (=> start!116656 m!1258815))

(declare-fun m!1258817 () Bool)

(assert (=> b!1375117 m!1258817))

(assert (=> b!1375117 m!1258817))

(declare-fun m!1258819 () Bool)

(assert (=> b!1375117 m!1258819))

(declare-fun m!1258821 () Bool)

(assert (=> b!1375120 m!1258821))

(declare-fun m!1258823 () Bool)

(assert (=> b!1375120 m!1258823))

(declare-fun m!1258825 () Bool)

(assert (=> b!1375120 m!1258825))

(declare-fun m!1258827 () Bool)

(assert (=> b!1375120 m!1258827))

(declare-fun m!1258829 () Bool)

(assert (=> b!1375120 m!1258829))

(declare-fun m!1258831 () Bool)

(assert (=> b!1375120 m!1258831))

(declare-fun m!1258833 () Bool)

(assert (=> b!1375120 m!1258833))

(declare-fun m!1258835 () Bool)

(assert (=> b!1375120 m!1258835))

(declare-fun m!1258837 () Bool)

(assert (=> b!1375120 m!1258837))

(declare-fun m!1258839 () Bool)

(assert (=> b!1375118 m!1258839))

(check-sat (not start!116656) (not b!1375117) (not b!1375118) (not b!1375120))
(check-sat)
