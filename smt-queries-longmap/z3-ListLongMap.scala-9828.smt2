; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116650 () Bool)

(assert start!116650)

(declare-fun b!1375047 () Bool)

(declare-fun e!778963 () Bool)

(declare-datatypes ((array!93273 0))(
  ( (array!93274 (arr!45040 (Array (_ BitVec 32) (_ BitVec 64))) (size!45592 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93273)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1375047 (= e!778963 (not (and (bvsge (size!45592 a!4142) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000))))))

(declare-fun lt!603887 () (_ BitVec 32))

(declare-fun lt!603886 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93273 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1375047 (= (bvadd lt!603887 lt!603886) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45592 a!4142)))))

(declare-datatypes ((Unit!45360 0))(
  ( (Unit!45361) )
))
(declare-fun lt!603890 () Unit!45360)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93273 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45360)

(assert (=> b!1375047 (= lt!603890 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45592 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603888 () (_ BitVec 32))

(assert (=> b!1375047 (= lt!603888 lt!603886)))

(assert (=> b!1375047 (= lt!603886 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45592 a!4142)))))

(declare-fun lt!603884 () array!93273)

(assert (=> b!1375047 (= lt!603888 (arrayCountValidKeys!0 lt!603884 (bvadd #b00000000000000000000000000000001 i!1457) (size!45592 a!4142)))))

(declare-fun lt!603889 () Unit!45360)

(declare-fun k0!2959 () (_ BitVec 64))

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45360)

(assert (=> b!1375047 (= lt!603889 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k0!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375047 (= (arrayCountValidKeys!0 lt!603884 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603887 #b00000000000000000000000000000001))))

(assert (=> b!1375047 (= lt!603887 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1375047 (= lt!603884 (array!93274 (store (arr!45040 a!4142) i!1457 k0!2959) (size!45592 a!4142)))))

(declare-fun lt!603885 () Unit!45360)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45360)

(assert (=> b!1375047 (= lt!603885 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k0!2959 i!1457))))

(declare-fun res!918143 () Bool)

(assert (=> start!116650 (=> (not res!918143) (not e!778963))))

(assert (=> start!116650 (= res!918143 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45592 a!4142))))))

(assert (=> start!116650 e!778963))

(assert (=> start!116650 true))

(declare-fun array_inv!34273 (array!93273) Bool)

(assert (=> start!116650 (array_inv!34273 a!4142)))

(declare-fun b!1375044 () Bool)

(declare-fun res!918146 () Bool)

(assert (=> b!1375044 (=> (not res!918146) (not e!778963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1375044 (= res!918146 (validKeyInArray!0 (select (arr!45040 a!4142) i!1457)))))

(declare-fun b!1375046 () Bool)

(declare-fun res!918145 () Bool)

(assert (=> b!1375046 (=> (not res!918145) (not e!778963))))

(assert (=> b!1375046 (= res!918145 (bvslt (size!45592 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1375045 () Bool)

(declare-fun res!918144 () Bool)

(assert (=> b!1375045 (=> (not res!918144) (not e!778963))))

(assert (=> b!1375045 (= res!918144 (not (validKeyInArray!0 k0!2959)))))

(assert (= (and start!116650 res!918143) b!1375044))

(assert (= (and b!1375044 res!918146) b!1375045))

(assert (= (and b!1375045 res!918144) b!1375046))

(assert (= (and b!1375046 res!918145) b!1375047))

(declare-fun m!1258287 () Bool)

(assert (=> b!1375047 m!1258287))

(declare-fun m!1258289 () Bool)

(assert (=> b!1375047 m!1258289))

(declare-fun m!1258291 () Bool)

(assert (=> b!1375047 m!1258291))

(declare-fun m!1258293 () Bool)

(assert (=> b!1375047 m!1258293))

(declare-fun m!1258295 () Bool)

(assert (=> b!1375047 m!1258295))

(declare-fun m!1258297 () Bool)

(assert (=> b!1375047 m!1258297))

(declare-fun m!1258299 () Bool)

(assert (=> b!1375047 m!1258299))

(declare-fun m!1258301 () Bool)

(assert (=> b!1375047 m!1258301))

(declare-fun m!1258303 () Bool)

(assert (=> b!1375047 m!1258303))

(declare-fun m!1258305 () Bool)

(assert (=> start!116650 m!1258305))

(declare-fun m!1258307 () Bool)

(assert (=> b!1375044 m!1258307))

(assert (=> b!1375044 m!1258307))

(declare-fun m!1258309 () Bool)

(assert (=> b!1375044 m!1258309))

(declare-fun m!1258311 () Bool)

(assert (=> b!1375045 m!1258311))

(check-sat (not b!1375047) (not b!1375045) (not start!116650) (not b!1375044))
(check-sat)
