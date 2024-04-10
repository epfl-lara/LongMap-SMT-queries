; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117246 () Bool)

(assert start!117246)

(declare-fun b!1379443 () Bool)

(declare-fun e!781432 () Bool)

(assert (=> b!1379443 (= e!781432 true)))

(declare-datatypes ((array!93842 0))(
  ( (array!93843 (arr!45320 (Array (_ BitVec 32) (_ BitVec 64))) (size!45870 (_ BitVec 32))) )
))
(declare-fun lt!607500 () array!93842)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun a!4094 () array!93842)

(declare-fun arrayCountValidKeys!0 (array!93842 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379443 (= (arrayCountValidKeys!0 lt!607500 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun from!3466 () (_ BitVec 32))

(declare-datatypes ((Unit!45867 0))(
  ( (Unit!45868) )
))
(declare-fun lt!607502 () Unit!45867)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93842 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45867)

(assert (=> b!1379443 (= lt!607502 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379444 () Bool)

(declare-fun e!781433 () Bool)

(declare-fun e!781430 () Bool)

(assert (=> b!1379444 (= e!781433 e!781430)))

(declare-fun res!921884 () Bool)

(assert (=> b!1379444 (=> (not res!921884) (not e!781430))))

(declare-fun lt!607495 () (_ BitVec 32))

(declare-fun lt!607498 () (_ BitVec 32))

(assert (=> b!1379444 (= res!921884 (and (= lt!607495 (bvsub lt!607498 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379444 (= lt!607495 (arrayCountValidKeys!0 lt!607500 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379444 (= lt!607498 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379444 (= lt!607500 (array!93843 (store (arr!45320 a!4094) i!1451 k!2953) (size!45870 a!4094)))))

(declare-fun res!921882 () Bool)

(assert (=> start!117246 (=> (not res!921882) (not e!781433))))

(assert (=> start!117246 (= res!921882 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45870 a!4094))))))

(assert (=> start!117246 e!781433))

(assert (=> start!117246 true))

(declare-fun array_inv!34348 (array!93842) Bool)

(assert (=> start!117246 (array_inv!34348 a!4094)))

(declare-fun b!1379445 () Bool)

(assert (=> b!1379445 (= e!781430 (not e!781432))))

(declare-fun res!921881 () Bool)

(assert (=> b!1379445 (=> res!921881 e!781432)))

(declare-fun lt!607494 () (_ BitVec 32))

(declare-fun lt!607499 () (_ BitVec 32))

(assert (=> b!1379445 (= res!921881 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45870 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607494 (bvsub lt!607499 #b00000000000000000000000000000001)))))))

(declare-fun lt!607501 () (_ BitVec 32))

(assert (=> b!1379445 (= (bvadd lt!607501 lt!607495) lt!607494)))

(assert (=> b!1379445 (= lt!607494 (arrayCountValidKeys!0 lt!607500 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379445 (= lt!607501 (arrayCountValidKeys!0 lt!607500 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607496 () Unit!45867)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93842 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45867)

(assert (=> b!1379445 (= lt!607496 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607500 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607503 () (_ BitVec 32))

(assert (=> b!1379445 (= (bvadd lt!607503 lt!607498) lt!607499)))

(assert (=> b!1379445 (= lt!607499 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379445 (= lt!607503 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607497 () Unit!45867)

(assert (=> b!1379445 (= lt!607497 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379446 () Bool)

(declare-fun res!921886 () Bool)

(assert (=> b!1379446 (=> (not res!921886) (not e!781433))))

(assert (=> b!1379446 (= res!921886 (and (bvslt (size!45870 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45870 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379447 () Bool)

(declare-fun res!921885 () Bool)

(assert (=> b!1379447 (=> (not res!921885) (not e!781433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379447 (= res!921885 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379448 () Bool)

(declare-fun res!921883 () Bool)

(assert (=> b!1379448 (=> (not res!921883) (not e!781433))))

(assert (=> b!1379448 (= res!921883 (validKeyInArray!0 (select (arr!45320 a!4094) i!1451)))))

(assert (= (and start!117246 res!921882) b!1379448))

(assert (= (and b!1379448 res!921883) b!1379447))

(assert (= (and b!1379447 res!921885) b!1379446))

(assert (= (and b!1379446 res!921886) b!1379444))

(assert (= (and b!1379444 res!921884) b!1379445))

(assert (= (and b!1379445 (not res!921881)) b!1379443))

(declare-fun m!1264509 () Bool)

(assert (=> start!117246 m!1264509))

(declare-fun m!1264511 () Bool)

(assert (=> b!1379444 m!1264511))

(declare-fun m!1264513 () Bool)

(assert (=> b!1379444 m!1264513))

(declare-fun m!1264515 () Bool)

(assert (=> b!1379444 m!1264515))

(declare-fun m!1264517 () Bool)

(assert (=> b!1379445 m!1264517))

(declare-fun m!1264519 () Bool)

(assert (=> b!1379445 m!1264519))

(declare-fun m!1264521 () Bool)

(assert (=> b!1379445 m!1264521))

(declare-fun m!1264523 () Bool)

(assert (=> b!1379445 m!1264523))

(declare-fun m!1264525 () Bool)

(assert (=> b!1379445 m!1264525))

(declare-fun m!1264527 () Bool)

(assert (=> b!1379445 m!1264527))

(declare-fun m!1264529 () Bool)

(assert (=> b!1379448 m!1264529))

(assert (=> b!1379448 m!1264529))

(declare-fun m!1264531 () Bool)

(assert (=> b!1379448 m!1264531))

(declare-fun m!1264533 () Bool)

(assert (=> b!1379443 m!1264533))

(declare-fun m!1264535 () Bool)

(assert (=> b!1379443 m!1264535))

(declare-fun m!1264537 () Bool)

(assert (=> b!1379443 m!1264537))

(declare-fun m!1264539 () Bool)

(assert (=> b!1379447 m!1264539))

(push 1)

(assert (not b!1379448))

(assert (not b!1379443))

(assert (not start!117246))

