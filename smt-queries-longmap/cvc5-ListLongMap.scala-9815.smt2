; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116534 () Bool)

(assert start!116534)

(declare-fun b!1374444 () Bool)

(declare-fun e!778641 () Bool)

(assert (=> b!1374444 (= e!778641 true)))

(declare-fun lt!603508 () (_ BitVec 32))

(declare-fun lt!603505 () (_ BitVec 32))

(declare-datatypes ((array!93193 0))(
  ( (array!93194 (arr!45003 (Array (_ BitVec 32) (_ BitVec 64))) (size!45555 (_ BitVec 32))) )
))
(declare-fun lt!603513 () array!93193)

(declare-fun a!4142 () array!93193)

(declare-fun arrayCountValidKeys!0 (array!93193 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374444 (= (bvadd lt!603505 lt!603508) (arrayCountValidKeys!0 lt!603513 #b00000000000000000000000000000000 (size!45555 a!4142)))))

(declare-datatypes ((Unit!45298 0))(
  ( (Unit!45299) )
))
(declare-fun lt!603506 () Unit!45298)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93193 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45298)

(assert (=> b!1374444 (= lt!603506 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!603513 #b00000000000000000000000000000000 (size!45555 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun res!917674 () Bool)

(declare-fun e!778640 () Bool)

(assert (=> start!116534 (=> (not res!917674) (not e!778640))))

(assert (=> start!116534 (= res!917674 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45555 a!4142))))))

(assert (=> start!116534 e!778640))

(assert (=> start!116534 true))

(declare-fun array_inv!34236 (array!93193) Bool)

(assert (=> start!116534 (array_inv!34236 a!4142)))

(declare-fun b!1374445 () Bool)

(declare-fun res!917675 () Bool)

(assert (=> b!1374445 (=> (not res!917675) (not e!778640))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374445 (= res!917675 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1374446 () Bool)

(assert (=> b!1374446 (= e!778640 (not e!778641))))

(declare-fun res!917672 () Bool)

(assert (=> b!1374446 (=> res!917672 e!778641)))

(assert (=> b!1374446 (= res!917672 (or (bvslt (size!45555 a!4142) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1457) #b00000000000000000000000000000000)))))

(declare-fun lt!603511 () (_ BitVec 32))

(declare-fun lt!603509 () (_ BitVec 32))

(assert (=> b!1374446 (= (bvadd lt!603511 lt!603509) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45555 a!4142)))))

(declare-fun lt!603510 () Unit!45298)

(assert (=> b!1374446 (= lt!603510 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45555 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374446 (= lt!603508 lt!603509)))

(assert (=> b!1374446 (= lt!603509 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45555 a!4142)))))

(assert (=> b!1374446 (= lt!603508 (arrayCountValidKeys!0 lt!603513 (bvadd #b00000000000000000000000000000001 i!1457) (size!45555 a!4142)))))

(declare-fun lt!603507 () Unit!45298)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45298)

(assert (=> b!1374446 (= lt!603507 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374446 (= lt!603505 (bvsub lt!603511 #b00000000000000000000000000000001))))

(assert (=> b!1374446 (= lt!603505 (arrayCountValidKeys!0 lt!603513 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374446 (= lt!603511 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1374446 (= lt!603513 (array!93194 (store (arr!45003 a!4142) i!1457 k!2959) (size!45555 a!4142)))))

(declare-fun lt!603512 () Unit!45298)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93193 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45298)

(assert (=> b!1374446 (= lt!603512 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374447 () Bool)

(declare-fun res!917671 () Bool)

(assert (=> b!1374447 (=> (not res!917671) (not e!778640))))

(assert (=> b!1374447 (= res!917671 (bvslt (size!45555 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374448 () Bool)

(declare-fun res!917673 () Bool)

(assert (=> b!1374448 (=> (not res!917673) (not e!778640))))

(assert (=> b!1374448 (= res!917673 (validKeyInArray!0 (select (arr!45003 a!4142) i!1457)))))

(assert (= (and start!116534 res!917674) b!1374448))

(assert (= (and b!1374448 res!917673) b!1374445))

(assert (= (and b!1374445 res!917675) b!1374447))

(assert (= (and b!1374447 res!917671) b!1374446))

(assert (= (and b!1374446 (not res!917672)) b!1374444))

(declare-fun m!1257441 () Bool)

(assert (=> b!1374444 m!1257441))

(declare-fun m!1257443 () Bool)

(assert (=> b!1374444 m!1257443))

(declare-fun m!1257445 () Bool)

(assert (=> b!1374446 m!1257445))

(declare-fun m!1257447 () Bool)

(assert (=> b!1374446 m!1257447))

(declare-fun m!1257449 () Bool)

(assert (=> b!1374446 m!1257449))

(declare-fun m!1257451 () Bool)

(assert (=> b!1374446 m!1257451))

(declare-fun m!1257453 () Bool)

(assert (=> b!1374446 m!1257453))

(declare-fun m!1257455 () Bool)

(assert (=> b!1374446 m!1257455))

(declare-fun m!1257457 () Bool)

(assert (=> b!1374446 m!1257457))

(declare-fun m!1257459 () Bool)

(assert (=> b!1374446 m!1257459))

(declare-fun m!1257461 () Bool)

(assert (=> b!1374446 m!1257461))

(declare-fun m!1257463 () Bool)

(assert (=> b!1374448 m!1257463))

(assert (=> b!1374448 m!1257463))

(declare-fun m!1257465 () Bool)

(assert (=> b!1374448 m!1257465))

(declare-fun m!1257467 () Bool)

(assert (=> start!116534 m!1257467))

(declare-fun m!1257469 () Bool)

(assert (=> b!1374445 m!1257469))

(push 1)

(assert (not b!1374445))

(assert (not b!1374448))

(assert (not start!116534))

(assert (not b!1374444))

(assert (not b!1374446))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

