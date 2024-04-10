; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116666 () Bool)

(assert start!116666)

(declare-fun b!1375188 () Bool)

(declare-fun res!918254 () Bool)

(declare-fun e!779036 () Bool)

(assert (=> b!1375188 (=> (not res!918254) (not e!779036))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375188 (= res!918254 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1375189 () Bool)

(declare-fun e!779038 () Bool)

(declare-fun lt!604220 () (_ BitVec 32))

(declare-fun lt!604219 () (_ BitVec 32))

(assert (=> b!1375189 (= e!779038 (= lt!604220 (bvsub lt!604219 #b00000000000000000000000000000001)))))

(declare-fun lt!604224 () (_ BitVec 32))

(declare-fun lt!604221 () (_ BitVec 32))

(assert (=> b!1375189 (= (bvadd lt!604224 lt!604221) lt!604220)))

(declare-datatypes ((array!93335 0))(
  ( (array!93336 (arr!45071 (Array (_ BitVec 32) (_ BitVec 64))) (size!45621 (_ BitVec 32))) )
))
(declare-fun lt!604227 () array!93335)

(declare-fun a!4142 () array!93335)

(declare-fun arrayCountValidKeys!0 (array!93335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375189 (= lt!604220 (arrayCountValidKeys!0 lt!604227 #b00000000000000000000000000000000 (size!45621 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45531 0))(
  ( (Unit!45532) )
))
(declare-fun lt!604218 () Unit!45531)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45531)

(assert (=> b!1375189 (= lt!604218 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604227 #b00000000000000000000000000000000 (size!45621 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!918256 () Bool)

(assert (=> start!116666 (=> (not res!918256) (not e!779036))))

(assert (=> start!116666 (= res!918256 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45621 a!4142))))))

(assert (=> start!116666 e!779036))

(assert (=> start!116666 true))

(declare-fun array_inv!34099 (array!93335) Bool)

(assert (=> start!116666 (array_inv!34099 a!4142)))

(declare-fun b!1375190 () Bool)

(declare-fun res!918253 () Bool)

(assert (=> b!1375190 (=> (not res!918253) (not e!779036))))

(assert (=> b!1375190 (= res!918253 (bvslt (size!45621 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375191 () Bool)

(declare-fun res!918255 () Bool)

(assert (=> b!1375191 (=> (not res!918255) (not e!779036))))

(assert (=> b!1375191 (= res!918255 (validKeyInArray!0 (select (arr!45071 a!4142) i!1457)))))

(declare-fun b!1375192 () Bool)

(assert (=> b!1375192 (= e!779036 (not e!779038))))

(declare-fun res!918252 () Bool)

(assert (=> b!1375192 (=> res!918252 e!779038)))

(assert (=> b!1375192 (= res!918252 (or (bvslt (size!45621 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604223 () (_ BitVec 32))

(declare-fun lt!604222 () (_ BitVec 32))

(assert (=> b!1375192 (= (bvadd lt!604223 lt!604222) lt!604219)))

(assert (=> b!1375192 (= lt!604219 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45621 a!4142)))))

(declare-fun lt!604226 () Unit!45531)

(assert (=> b!1375192 (= lt!604226 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45621 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375192 (= lt!604221 lt!604222)))

(assert (=> b!1375192 (= lt!604222 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45621 a!4142)))))

(assert (=> b!1375192 (= lt!604221 (arrayCountValidKeys!0 lt!604227 (bvadd #b00000000000000000000000000000001 i!1457) (size!45621 a!4142)))))

(declare-fun lt!604225 () Unit!45531)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45531)

(assert (=> b!1375192 (= lt!604225 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375192 (= lt!604224 (bvsub lt!604223 #b00000000000000000000000000000001))))

(assert (=> b!1375192 (= lt!604224 (arrayCountValidKeys!0 lt!604227 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375192 (= lt!604223 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375192 (= lt!604227 (array!93336 (store (arr!45071 a!4142) i!1457 k!2959) (size!45621 a!4142)))))

(declare-fun lt!604228 () Unit!45531)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93335 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45531)

(assert (=> b!1375192 (= lt!604228 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(assert (= (and start!116666 res!918256) b!1375191))

(assert (= (and b!1375191 res!918255) b!1375188))

(assert (= (and b!1375188 res!918254) b!1375190))

(assert (= (and b!1375190 res!918253) b!1375192))

(assert (= (and b!1375192 (not res!918252)) b!1375189))

(declare-fun m!1258957 () Bool)

(assert (=> b!1375191 m!1258957))

(assert (=> b!1375191 m!1258957))

(declare-fun m!1258959 () Bool)

(assert (=> b!1375191 m!1258959))

(declare-fun m!1258961 () Bool)

(assert (=> b!1375188 m!1258961))

(declare-fun m!1258963 () Bool)

(assert (=> b!1375192 m!1258963))

(declare-fun m!1258965 () Bool)

(assert (=> b!1375192 m!1258965))

(declare-fun m!1258967 () Bool)

(assert (=> b!1375192 m!1258967))

(declare-fun m!1258969 () Bool)

(assert (=> b!1375192 m!1258969))

(declare-fun m!1258971 () Bool)

(assert (=> b!1375192 m!1258971))

(declare-fun m!1258973 () Bool)

(assert (=> b!1375192 m!1258973))

(declare-fun m!1258975 () Bool)

(assert (=> b!1375192 m!1258975))

(declare-fun m!1258977 () Bool)

(assert (=> b!1375192 m!1258977))

(declare-fun m!1258979 () Bool)

(assert (=> b!1375192 m!1258979))

(declare-fun m!1258981 () Bool)

(assert (=> start!116666 m!1258981))

(declare-fun m!1258983 () Bool)

(assert (=> b!1375189 m!1258983))

(declare-fun m!1258985 () Bool)

(assert (=> b!1375189 m!1258985))

(push 1)

(assert (not b!1375189))

(assert (not b!1375188))

(assert (not b!1375192))

(assert (not start!116666))

(assert (not b!1375191))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

