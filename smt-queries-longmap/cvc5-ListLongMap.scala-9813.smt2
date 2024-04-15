; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116522 () Bool)

(assert start!116522)

(declare-fun b!1374355 () Bool)

(declare-fun res!917582 () Bool)

(declare-fun e!778586 () Bool)

(assert (=> b!1374355 (=> (not res!917582) (not e!778586))))

(declare-datatypes ((array!93181 0))(
  ( (array!93182 (arr!44997 (Array (_ BitVec 32) (_ BitVec 64))) (size!45549 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93181)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374355 (= res!917582 (validKeyInArray!0 (select (arr!44997 a!4142) i!1457)))))

(declare-fun b!1374356 () Bool)

(declare-fun res!917583 () Bool)

(assert (=> b!1374356 (=> (not res!917583) (not e!778586))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1374356 (= res!917583 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374357 () Bool)

(declare-fun res!917584 () Bool)

(assert (=> b!1374357 (=> (not res!917584) (not e!778586))))

(assert (=> b!1374357 (= res!917584 (bvslt (size!45549 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374358 () Bool)

(assert (=> b!1374358 (= e!778586 (not true))))

(declare-fun lt!603348 () (_ BitVec 32))

(declare-fun lt!603345 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93181 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374358 (= (bvadd lt!603348 lt!603345) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45549 a!4142)))))

(declare-datatypes ((Unit!45286 0))(
  ( (Unit!45287) )
))
(declare-fun lt!603351 () Unit!45286)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93181 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45286)

(assert (=> b!1374358 (= lt!603351 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45549 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603347 () (_ BitVec 32))

(assert (=> b!1374358 (= lt!603347 lt!603345)))

(assert (=> b!1374358 (= lt!603345 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45549 a!4142)))))

(declare-fun lt!603349 () array!93181)

(assert (=> b!1374358 (= lt!603347 (arrayCountValidKeys!0 lt!603349 (bvadd #b00000000000000000000000000000001 i!1457) (size!45549 a!4142)))))

(declare-fun lt!603350 () Unit!45286)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45286)

(assert (=> b!1374358 (= lt!603350 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374358 (= (arrayCountValidKeys!0 lt!603349 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!603348 #b00000000000000000000000000000001))))

(assert (=> b!1374358 (= lt!603348 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374358 (= lt!603349 (array!93182 (store (arr!44997 a!4142) i!1457 k!2959) (size!45549 a!4142)))))

(declare-fun lt!603346 () Unit!45286)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93181 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45286)

(assert (=> b!1374358 (= lt!603346 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun res!917585 () Bool)

(assert (=> start!116522 (=> (not res!917585) (not e!778586))))

(assert (=> start!116522 (= res!917585 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45549 a!4142))))))

(assert (=> start!116522 e!778586))

(assert (=> start!116522 true))

(declare-fun array_inv!34230 (array!93181) Bool)

(assert (=> start!116522 (array_inv!34230 a!4142)))

(assert (= (and start!116522 res!917585) b!1374355))

(assert (= (and b!1374355 res!917582) b!1374356))

(assert (= (and b!1374356 res!917583) b!1374357))

(assert (= (and b!1374357 res!917584) b!1374358))

(declare-fun m!1257265 () Bool)

(assert (=> b!1374355 m!1257265))

(assert (=> b!1374355 m!1257265))

(declare-fun m!1257267 () Bool)

(assert (=> b!1374355 m!1257267))

(declare-fun m!1257269 () Bool)

(assert (=> b!1374356 m!1257269))

(declare-fun m!1257271 () Bool)

(assert (=> b!1374358 m!1257271))

(declare-fun m!1257273 () Bool)

(assert (=> b!1374358 m!1257273))

(declare-fun m!1257275 () Bool)

(assert (=> b!1374358 m!1257275))

(declare-fun m!1257277 () Bool)

(assert (=> b!1374358 m!1257277))

(declare-fun m!1257279 () Bool)

(assert (=> b!1374358 m!1257279))

(declare-fun m!1257281 () Bool)

(assert (=> b!1374358 m!1257281))

(declare-fun m!1257283 () Bool)

(assert (=> b!1374358 m!1257283))

(declare-fun m!1257285 () Bool)

(assert (=> b!1374358 m!1257285))

(declare-fun m!1257287 () Bool)

(assert (=> b!1374358 m!1257287))

(declare-fun m!1257289 () Bool)

(assert (=> start!116522 m!1257289))

(push 1)

(assert (not b!1374358))

(assert (not start!116522))

(assert (not b!1374355))

(assert (not b!1374356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

