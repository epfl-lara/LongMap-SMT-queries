; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116882 () Bool)

(assert start!116882)

(declare-fun b!1376407 () Bool)

(declare-fun res!918679 () Bool)

(declare-fun e!779836 () Bool)

(assert (=> b!1376407 (=> (not res!918679) (not e!779836))))

(declare-datatypes ((array!93437 0))(
  ( (array!93438 (arr!45117 (Array (_ BitVec 32) (_ BitVec 64))) (size!45668 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93437)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1376407 (= res!918679 (validKeyInArray!0 (select (arr!45117 a!4142) i!1457)))))

(declare-fun b!1376408 () Bool)

(declare-fun res!918678 () Bool)

(assert (=> b!1376408 (=> (not res!918678) (not e!779836))))

(declare-fun k!2959 () (_ BitVec 64))

(assert (=> b!1376408 (= res!918678 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!918680 () Bool)

(assert (=> start!116882 (=> (not res!918680) (not e!779836))))

(assert (=> start!116882 (= res!918680 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45668 a!4142))))))

(assert (=> start!116882 e!779836))

(assert (=> start!116882 true))

(declare-fun array_inv!34398 (array!93437) Bool)

(assert (=> start!116882 (array_inv!34398 a!4142)))

(declare-fun b!1376410 () Bool)

(assert (=> b!1376410 (= e!779836 (not true))))

(declare-fun lt!604533 () (_ BitVec 32))

(declare-fun lt!604531 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93437 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1376410 (= (bvadd lt!604533 lt!604531) (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (size!45668 a!4142)))))

(declare-datatypes ((Unit!45456 0))(
  ( (Unit!45457) )
))
(declare-fun lt!604527 () Unit!45456)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45456)

(assert (=> b!1376410 (= lt!604527 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4142 #b00000000000000000000000000000000 (size!45668 a!4142) (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!604529 () (_ BitVec 32))

(assert (=> b!1376410 (= lt!604529 lt!604531)))

(assert (=> b!1376410 (= lt!604531 (arrayCountValidKeys!0 a!4142 (bvadd #b00000000000000000000000000000001 i!1457) (size!45668 a!4142)))))

(declare-fun lt!604532 () array!93437)

(assert (=> b!1376410 (= lt!604529 (arrayCountValidKeys!0 lt!604532 (bvadd #b00000000000000000000000000000001 i!1457) (size!45668 a!4142)))))

(declare-fun lt!604530 () Unit!45456)

(declare-fun lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 (array!93437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45456)

(assert (=> b!1376410 (= lt!604530 (lemmaRemoveValidKeyAndNumKeysToImpliesToALength!0 a!4142 i!1457 k!2959 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376410 (= (arrayCountValidKeys!0 lt!604532 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub lt!604533 #b00000000000000000000000000000001))))

(assert (=> b!1376410 (= lt!604533 (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)))))

(assert (=> b!1376410 (= lt!604532 (array!93438 (store (arr!45117 a!4142) i!1457 k!2959) (size!45668 a!4142)))))

(declare-fun lt!604528 () Unit!45456)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45456)

(assert (=> b!1376410 (= lt!604528 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1376409 () Bool)

(declare-fun res!918681 () Bool)

(assert (=> b!1376409 (=> (not res!918681) (not e!779836))))

(assert (=> b!1376409 (= res!918681 (bvslt (size!45668 a!4142) #b01111111111111111111111111111111))))

(assert (= (and start!116882 res!918680) b!1376407))

(assert (= (and b!1376407 res!918679) b!1376408))

(assert (= (and b!1376408 res!918678) b!1376409))

(assert (= (and b!1376409 res!918681) b!1376410))

(declare-fun m!1260387 () Bool)

(assert (=> b!1376407 m!1260387))

(assert (=> b!1376407 m!1260387))

(declare-fun m!1260389 () Bool)

(assert (=> b!1376407 m!1260389))

(declare-fun m!1260391 () Bool)

(assert (=> b!1376408 m!1260391))

(declare-fun m!1260393 () Bool)

(assert (=> start!116882 m!1260393))

(declare-fun m!1260395 () Bool)

(assert (=> b!1376410 m!1260395))

(declare-fun m!1260397 () Bool)

(assert (=> b!1376410 m!1260397))

(declare-fun m!1260399 () Bool)

(assert (=> b!1376410 m!1260399))

(declare-fun m!1260401 () Bool)

(assert (=> b!1376410 m!1260401))

(declare-fun m!1260403 () Bool)

(assert (=> b!1376410 m!1260403))

(declare-fun m!1260405 () Bool)

(assert (=> b!1376410 m!1260405))

(declare-fun m!1260407 () Bool)

(assert (=> b!1376410 m!1260407))

(declare-fun m!1260409 () Bool)

(assert (=> b!1376410 m!1260409))

(declare-fun m!1260411 () Bool)

(assert (=> b!1376410 m!1260411))

(push 1)

(assert (not start!116882))

(assert (not b!1376407))

(assert (not b!1376408))

(assert (not b!1376410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

