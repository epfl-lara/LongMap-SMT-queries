; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117248 () Bool)

(assert start!117248)

(declare-fun b!1379461 () Bool)

(declare-fun res!921902 () Bool)

(declare-fun e!781443 () Bool)

(assert (=> b!1379461 (=> (not res!921902) (not e!781443))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379461 (= res!921902 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379462 () Bool)

(declare-fun res!921900 () Bool)

(assert (=> b!1379462 (=> (not res!921900) (not e!781443))))

(declare-datatypes ((array!93844 0))(
  ( (array!93845 (arr!45321 (Array (_ BitVec 32) (_ BitVec 64))) (size!45871 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93844)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379462 (= res!921900 (validKeyInArray!0 (select (arr!45321 a!4094) i!1451)))))

(declare-fun b!1379463 () Bool)

(declare-fun e!781445 () Bool)

(assert (=> b!1379463 (= e!781445 true)))

(declare-fun lt!607524 () array!93844)

(declare-fun arrayCountValidKeys!0 (array!93844 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379463 (= (arrayCountValidKeys!0 lt!607524 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((Unit!45869 0))(
  ( (Unit!45870) )
))
(declare-fun lt!607530 () Unit!45869)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93844 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45869)

(assert (=> b!1379463 (= lt!607530 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k0!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379464 () Bool)

(declare-fun e!781442 () Bool)

(assert (=> b!1379464 (= e!781443 e!781442)))

(declare-fun res!921904 () Bool)

(assert (=> b!1379464 (=> (not res!921904) (not e!781442))))

(declare-fun lt!607531 () (_ BitVec 32))

(declare-fun lt!607525 () (_ BitVec 32))

(assert (=> b!1379464 (= res!921904 (and (= lt!607531 (bvsub lt!607525 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379464 (= lt!607531 (arrayCountValidKeys!0 lt!607524 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379464 (= lt!607525 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379464 (= lt!607524 (array!93845 (store (arr!45321 a!4094) i!1451 k0!2953) (size!45871 a!4094)))))

(declare-fun b!1379465 () Bool)

(assert (=> b!1379465 (= e!781442 (not e!781445))))

(declare-fun res!921901 () Bool)

(assert (=> b!1379465 (=> res!921901 e!781445)))

(declare-fun lt!607529 () (_ BitVec 32))

(declare-fun lt!607532 () (_ BitVec 32))

(assert (=> b!1379465 (= res!921901 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45871 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607529 (bvsub lt!607532 #b00000000000000000000000000000001)))))))

(declare-fun lt!607528 () (_ BitVec 32))

(assert (=> b!1379465 (= (bvadd lt!607528 lt!607531) lt!607529)))

(assert (=> b!1379465 (= lt!607529 (arrayCountValidKeys!0 lt!607524 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379465 (= lt!607528 (arrayCountValidKeys!0 lt!607524 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607527 () Unit!45869)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93844 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45869)

(assert (=> b!1379465 (= lt!607527 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607524 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607526 () (_ BitVec 32))

(assert (=> b!1379465 (= (bvadd lt!607526 lt!607525) lt!607532)))

(assert (=> b!1379465 (= lt!607532 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379465 (= lt!607526 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607533 () Unit!45869)

(assert (=> b!1379465 (= lt!607533 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921899 () Bool)

(assert (=> start!117248 (=> (not res!921899) (not e!781443))))

(assert (=> start!117248 (= res!921899 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45871 a!4094))))))

(assert (=> start!117248 e!781443))

(assert (=> start!117248 true))

(declare-fun array_inv!34349 (array!93844) Bool)

(assert (=> start!117248 (array_inv!34349 a!4094)))

(declare-fun b!1379466 () Bool)

(declare-fun res!921903 () Bool)

(assert (=> b!1379466 (=> (not res!921903) (not e!781443))))

(assert (=> b!1379466 (= res!921903 (and (bvslt (size!45871 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45871 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117248 res!921899) b!1379462))

(assert (= (and b!1379462 res!921900) b!1379461))

(assert (= (and b!1379461 res!921902) b!1379466))

(assert (= (and b!1379466 res!921903) b!1379464))

(assert (= (and b!1379464 res!921904) b!1379465))

(assert (= (and b!1379465 (not res!921901)) b!1379463))

(declare-fun m!1264541 () Bool)

(assert (=> b!1379462 m!1264541))

(assert (=> b!1379462 m!1264541))

(declare-fun m!1264543 () Bool)

(assert (=> b!1379462 m!1264543))

(declare-fun m!1264545 () Bool)

(assert (=> start!117248 m!1264545))

(declare-fun m!1264547 () Bool)

(assert (=> b!1379461 m!1264547))

(declare-fun m!1264549 () Bool)

(assert (=> b!1379465 m!1264549))

(declare-fun m!1264551 () Bool)

(assert (=> b!1379465 m!1264551))

(declare-fun m!1264553 () Bool)

(assert (=> b!1379465 m!1264553))

(declare-fun m!1264555 () Bool)

(assert (=> b!1379465 m!1264555))

(declare-fun m!1264557 () Bool)

(assert (=> b!1379465 m!1264557))

(declare-fun m!1264559 () Bool)

(assert (=> b!1379465 m!1264559))

(declare-fun m!1264561 () Bool)

(assert (=> b!1379463 m!1264561))

(declare-fun m!1264563 () Bool)

(assert (=> b!1379463 m!1264563))

(declare-fun m!1264565 () Bool)

(assert (=> b!1379463 m!1264565))

(declare-fun m!1264567 () Bool)

(assert (=> b!1379464 m!1264567))

(declare-fun m!1264569 () Bool)

(assert (=> b!1379464 m!1264569))

(declare-fun m!1264571 () Bool)

(assert (=> b!1379464 m!1264571))

(check-sat (not b!1379462) (not b!1379465) (not b!1379464) (not b!1379461) (not start!117248) (not b!1379463))
