; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116668 () Bool)

(assert start!116668)

(declare-fun b!1375203 () Bool)

(declare-fun res!918271 () Bool)

(declare-fun e!779045 () Bool)

(assert (=> b!1375203 (=> (not res!918271) (not e!779045))))

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375203 (= res!918271 (not (validKeyInArray!0 k0!2959)))))

(declare-fun b!1375204 () Bool)

(declare-fun e!779046 () Bool)

(assert (=> b!1375204 (= e!779045 (not e!779046))))

(declare-fun res!918267 () Bool)

(assert (=> b!1375204 (=> res!918267 e!779046)))

(declare-datatypes ((array!93337 0))(
  ( (array!93338 (arr!45072 (Array (_ BitVec 32) (_ BitVec 64))) (size!45622 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93337)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375204 (= res!918267 (or (bvslt (size!45622 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!604261 () (_ BitVec 32))

(declare-fun lt!604255 () (_ BitVec 32))

(declare-fun lt!604252 () (_ BitVec 32))

(assert (=> b!1375204 (= (bvadd lt!604261 lt!604255) lt!604252)))

(declare-fun arrayCountValidKeys!0 (array!93337 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375204 (= lt!604252 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45622 a!4142)))))

(declare-datatypes ((Unit!45533 0))(
  ( (Unit!45534) )
))
(declare-fun lt!604258 () Unit!45533)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93337 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45533)

(assert (=> b!1375204 (= lt!604258 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45622 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604254 () (_ BitVec 32))

(assert (=> b!1375204 (= lt!604254 lt!604255)))

(assert (=> b!1375204 (= lt!604255 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45622 a!4142)))))

(declare-fun lt!604253 () array!93337)

(assert (=> b!1375204 (= lt!604254 (arrayCountValidKeys!0 lt!604253 (bvadd #b00000000000000000000000000000001 i!1457) (size!45622 a!4142)))))

(declare-fun lt!604257 () Unit!45533)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45533)

(assert (=> b!1375204 (= lt!604257 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604251 () (_ BitVec 32))

(assert (=> b!1375204 (= lt!604251 (bvsub lt!604261 #b00000000000000000000000000000001))))

(assert (=> b!1375204 (= lt!604251 (arrayCountValidKeys!0 lt!604253 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375204 (= lt!604261 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375204 (= lt!604253 (array!93338 (store (arr!45072 a!4142) i!1457 k0!2959) (size!45622 a!4142)))))

(declare-fun lt!604256 () Unit!45533)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45533)

(assert (=> b!1375204 (= lt!604256 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun b!1375205 () Bool)

(declare-fun lt!604259 () (_ BitVec 32))

(assert (=> b!1375205 (= e!779046 (= lt!604259 (bvsub lt!604252 #b00000000000000000000000000000001)))))

(assert (=> b!1375205 (= (bvadd lt!604251 lt!604254) lt!604259)))

(assert (=> b!1375205 (= lt!604259 (arrayCountValidKeys!0 lt!604253 #b00000000000000000000000000000000 (size!45622 a!4142)))))

(declare-fun lt!604260 () Unit!45533)

(assert (=> b!1375205 (= lt!604260 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!604253 #b00000000000000000000000000000000 (size!45622 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!918268 () Bool)

(assert (=> start!116668 (=> (not res!918268) (not e!779045))))

(assert (=> start!116668 (= res!918268 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45622 a!4142))))))

(assert (=> start!116668 e!779045))

(assert (=> start!116668 true))

(declare-fun array_inv!34100 (array!93337) Bool)

(assert (=> start!116668 (array_inv!34100 a!4142)))

(declare-fun b!1375206 () Bool)

(declare-fun res!918270 () Bool)

(assert (=> b!1375206 (=> (not res!918270) (not e!779045))))

(assert (=> b!1375206 (= res!918270 (bvslt (size!45622 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375207 () Bool)

(declare-fun res!918269 () Bool)

(assert (=> b!1375207 (=> (not res!918269) (not e!779045))))

(assert (=> b!1375207 (= res!918269 (validKeyInArray!0 (select (arr!45072 a!4142) i!1457)))))

(assert (= (and start!116668 res!918268) b!1375207))

(assert (= (and b!1375207 res!918269) b!1375203))

(assert (= (and b!1375203 res!918271) b!1375206))

(assert (= (and b!1375206 res!918270) b!1375204))

(assert (= (and b!1375204 (not res!918267)) b!1375205))

(declare-fun m!1258987 () Bool)

(assert (=> start!116668 m!1258987))

(declare-fun m!1258989 () Bool)

(assert (=> b!1375205 m!1258989))

(declare-fun m!1258991 () Bool)

(assert (=> b!1375205 m!1258991))

(declare-fun m!1258993 () Bool)

(assert (=> b!1375204 m!1258993))

(declare-fun m!1258995 () Bool)

(assert (=> b!1375204 m!1258995))

(declare-fun m!1258997 () Bool)

(assert (=> b!1375204 m!1258997))

(declare-fun m!1258999 () Bool)

(assert (=> b!1375204 m!1258999))

(declare-fun m!1259001 () Bool)

(assert (=> b!1375204 m!1259001))

(declare-fun m!1259003 () Bool)

(assert (=> b!1375204 m!1259003))

(declare-fun m!1259005 () Bool)

(assert (=> b!1375204 m!1259005))

(declare-fun m!1259007 () Bool)

(assert (=> b!1375204 m!1259007))

(declare-fun m!1259009 () Bool)

(assert (=> b!1375204 m!1259009))

(declare-fun m!1259011 () Bool)

(assert (=> b!1375203 m!1259011))

(declare-fun m!1259013 () Bool)

(assert (=> b!1375207 m!1259013))

(assert (=> b!1375207 m!1259013))

(declare-fun m!1259015 () Bool)

(assert (=> b!1375207 m!1259015))

(check-sat (not start!116668) (not b!1375204) (not b!1375207) (not b!1375205) (not b!1375203))
