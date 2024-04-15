; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116528 () Bool)

(assert start!116528)

(declare-fun b!1374399 () Bool)

(declare-fun e!778612 () Bool)

(assert (=> b!1374399 (= e!778612 true)))

(declare-fun lt!603425 () (_ BitVec 32))

(declare-fun lt!603426 () (_ BitVec 32))

(declare-datatypes ((array!93187 0))(
  ( (array!93188 (arr!45000 (Array (_ BitVec 32) (_ BitVec 64))) (size!45552 (_ BitVec 32))) )
))
(declare-fun lt!603428 () array!93187)

(declare-fun a!4142 () array!93187)

(declare-fun arrayCountValidKeys!0 (array!93187 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374399 (= (bvadd lt!603425 lt!603426) (arrayCountValidKeys!0 lt!603428 #b00000000000000000000000000000000 (size!45552 a!4142)))))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((Unit!45292 0))(
  ( (Unit!45293) )
))
(declare-fun lt!603431 () Unit!45292)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93187 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45292)

(assert (=> b!1374399 (= lt!603431 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603428 #b00000000000000000000000000000000 (size!45552 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1374400 () Bool)

(declare-fun res!917627 () Bool)

(declare-fun e!778613 () Bool)

(assert (=> b!1374400 (=> (not res!917627) (not e!778613))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374400 (= res!917627 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917629 () Bool)

(assert (=> start!116528 (=> (not res!917629) (not e!778613))))

(assert (=> start!116528 (= res!917629 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45552 a!4142))))))

(assert (=> start!116528 e!778613))

(assert (=> start!116528 true))

(declare-fun array_inv!34233 (array!93187) Bool)

(assert (=> start!116528 (array_inv!34233 a!4142)))

(declare-fun b!1374401 () Bool)

(assert (=> b!1374401 (= e!778613 (not e!778612))))

(declare-fun res!917630 () Bool)

(assert (=> b!1374401 (=> res!917630 e!778612)))

(assert (=> b!1374401 (= res!917630 (or (bvslt (size!45552 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603430 () (_ BitVec 32))

(declare-fun lt!603424 () (_ BitVec 32))

(assert (=> b!1374401 (= (bvadd lt!603430 lt!603424) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45552 a!4142)))))

(declare-fun lt!603429 () Unit!45292)

(assert (=> b!1374401 (= lt!603429 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45552 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374401 (= lt!603426 lt!603424)))

(assert (=> b!1374401 (= lt!603424 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45552 a!4142)))))

(assert (=> b!1374401 (= lt!603426 (arrayCountValidKeys!0 lt!603428 (bvadd #b00000000000000000000000000000001 i!1457) (size!45552 a!4142)))))

(declare-fun lt!603427 () Unit!45292)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45292)

(assert (=> b!1374401 (= lt!603427 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374401 (= lt!603425 (bvsub lt!603430 #b00000000000000000000000000000001))))

(assert (=> b!1374401 (= lt!603425 (arrayCountValidKeys!0 lt!603428 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374401 (= lt!603430 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374401 (= lt!603428 (array!93188 (store (arr!45000 a!4142) i!1457 k!2959) (size!45552 a!4142)))))

(declare-fun lt!603432 () Unit!45292)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93187 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45292)

(assert (=> b!1374401 (= lt!603432 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374402 () Bool)

(declare-fun res!917628 () Bool)

(assert (=> b!1374402 (=> (not res!917628) (not e!778613))))

(assert (=> b!1374402 (= res!917628 (bvslt (size!45552 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374403 () Bool)

(declare-fun res!917626 () Bool)

(assert (=> b!1374403 (=> (not res!917626) (not e!778613))))

(assert (=> b!1374403 (= res!917626 (validKeyInArray!0 (select (arr!45000 a!4142) i!1457)))))

(assert (= (and start!116528 res!917629) b!1374403))

(assert (= (and b!1374403 res!917626) b!1374400))

(assert (= (and b!1374400 res!917627) b!1374402))

(assert (= (and b!1374402 res!917628) b!1374401))

(assert (= (and b!1374401 (not res!917630)) b!1374399))

(declare-fun m!1257351 () Bool)

(assert (=> start!116528 m!1257351))

(declare-fun m!1257353 () Bool)

(assert (=> b!1374403 m!1257353))

(assert (=> b!1374403 m!1257353))

(declare-fun m!1257355 () Bool)

(assert (=> b!1374403 m!1257355))

(declare-fun m!1257357 () Bool)

(assert (=> b!1374400 m!1257357))

(declare-fun m!1257359 () Bool)

(assert (=> b!1374399 m!1257359))

(declare-fun m!1257361 () Bool)

(assert (=> b!1374399 m!1257361))

(declare-fun m!1257363 () Bool)

(assert (=> b!1374401 m!1257363))

(declare-fun m!1257365 () Bool)

(assert (=> b!1374401 m!1257365))

(declare-fun m!1257367 () Bool)

(assert (=> b!1374401 m!1257367))

(declare-fun m!1257369 () Bool)

(assert (=> b!1374401 m!1257369))

(declare-fun m!1257371 () Bool)

(assert (=> b!1374401 m!1257371))

(declare-fun m!1257373 () Bool)

(assert (=> b!1374401 m!1257373))

(declare-fun m!1257375 () Bool)

(assert (=> b!1374401 m!1257375))

(declare-fun m!1257377 () Bool)

(assert (=> b!1374401 m!1257377))

(declare-fun m!1257379 () Bool)

(assert (=> b!1374401 m!1257379))

(push 1)

(assert (not b!1374403))

(assert (not start!116528))

(assert (not b!1374400))

(assert (not b!1374399))

(assert (not b!1374401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

