; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116660 () Bool)

(assert start!116660)

(declare-fun b!1375143 () Bool)

(declare-fun res!918210 () Bool)

(declare-fun e!779011 () Bool)

(assert (=> b!1375143 (=> (not res!918210) (not e!779011))))

(declare-datatypes ((array!93329 0))(
  ( (array!93330 (arr!45068 (Array (_ BitVec 32) (_ BitVec 64))) (size!45618 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93329)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375143 (= res!918210 (validKeyInArray!0 (select (arr!45068 a!4142) i!1457)))))

(declare-fun b!1375144 () Bool)

(declare-fun e!779009 () Bool)

(assert (=> b!1375144 (= e!779011 (not e!779009))))

(declare-fun res!918211 () Bool)

(assert (=> b!1375144 (=> res!918211 e!779009)))

(assert (=> b!1375144 (= res!918211 (or (bvslt (size!45618 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604133 () (_ BitVec 32))

(declare-fun lt!604140 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93329 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375144 (= (bvadd lt!604133 lt!604140) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45618 a!4142)))))

(declare-datatypes ((Unit!45525 0))(
  ( (Unit!45526) )
))
(declare-fun lt!604137 () Unit!45525)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45525)

(assert (=> b!1375144 (= lt!604137 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45618 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604134 () (_ BitVec 32))

(assert (=> b!1375144 (= lt!604134 lt!604140)))

(assert (=> b!1375144 (= lt!604140 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45618 a!4142)))))

(declare-fun lt!604135 () array!93329)

(assert (=> b!1375144 (= lt!604134 (arrayCountValidKeys!0 lt!604135 (bvadd #b00000000000000000000000000000001 i!1457) (size!45618 a!4142)))))

(declare-fun lt!604139 () Unit!45525)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45525)

(assert (=> b!1375144 (= lt!604139 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604138 () (_ BitVec 32))

(assert (=> b!1375144 (= lt!604138 (bvsub lt!604133 #b00000000000000000000000000000001))))

(assert (=> b!1375144 (= lt!604138 (arrayCountValidKeys!0 lt!604135 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375144 (= lt!604133 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375144 (= lt!604135 (array!93330 (store (arr!45068 a!4142) i!1457 k!2959) (size!45618 a!4142)))))

(declare-fun lt!604136 () Unit!45525)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93329 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45525)

(assert (=> b!1375144 (= lt!604136 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1375145 () Bool)

(declare-fun res!918208 () Bool)

(assert (=> b!1375145 (=> (not res!918208) (not e!779011))))

(assert (=> b!1375145 (= res!918208 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!918207 () Bool)

(assert (=> start!116660 (=> (not res!918207) (not e!779011))))

(assert (=> start!116660 (= res!918207 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45618 a!4142))))))

(assert (=> start!116660 e!779011))

(assert (=> start!116660 true))

(declare-fun array_inv!34096 (array!93329) Bool)

(assert (=> start!116660 (array_inv!34096 a!4142)))

(declare-fun b!1375146 () Bool)

(declare-fun res!918209 () Bool)

(assert (=> b!1375146 (=> (not res!918209) (not e!779011))))

(assert (=> b!1375146 (= res!918209 (bvslt (size!45618 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375147 () Bool)

(assert (=> b!1375147 (= e!779009 true)))

(assert (=> b!1375147 (= (bvadd lt!604138 lt!604134) (arrayCountValidKeys!0 lt!604135 #b00000000000000000000000000000000 (size!45618 a!4142)))))

(declare-fun lt!604141 () Unit!45525)

(assert (=> b!1375147 (= lt!604141 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604135 #b00000000000000000000000000000000 (size!45618 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (= (and start!116660 res!918207) b!1375143))

(assert (= (and b!1375143 res!918210) b!1375145))

(assert (= (and b!1375145 res!918208) b!1375146))

(assert (= (and b!1375146 res!918209) b!1375144))

(assert (= (and b!1375144 (not res!918211)) b!1375147))

(declare-fun m!1258867 () Bool)

(assert (=> b!1375143 m!1258867))

(assert (=> b!1375143 m!1258867))

(declare-fun m!1258869 () Bool)

(assert (=> b!1375143 m!1258869))

(declare-fun m!1258871 () Bool)

(assert (=> start!116660 m!1258871))

(declare-fun m!1258873 () Bool)

(assert (=> b!1375144 m!1258873))

(declare-fun m!1258875 () Bool)

(assert (=> b!1375144 m!1258875))

(declare-fun m!1258877 () Bool)

(assert (=> b!1375144 m!1258877))

(declare-fun m!1258879 () Bool)

(assert (=> b!1375144 m!1258879))

(declare-fun m!1258881 () Bool)

(assert (=> b!1375144 m!1258881))

(declare-fun m!1258883 () Bool)

(assert (=> b!1375144 m!1258883))

(declare-fun m!1258885 () Bool)

(assert (=> b!1375144 m!1258885))

(declare-fun m!1258887 () Bool)

(assert (=> b!1375144 m!1258887))

(declare-fun m!1258889 () Bool)

(assert (=> b!1375144 m!1258889))

(declare-fun m!1258891 () Bool)

(assert (=> b!1375147 m!1258891))

(declare-fun m!1258893 () Bool)

(assert (=> b!1375147 m!1258893))

(declare-fun m!1258895 () Bool)

(assert (=> b!1375145 m!1258895))

(push 1)

(assert (not start!116660))

(assert (not b!1375143))

(assert (not b!1375147))

(assert (not b!1375144))

(assert (not b!1375145))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

