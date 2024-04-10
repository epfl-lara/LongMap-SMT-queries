; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117240 () Bool)

(assert start!117240)

(declare-fun b!1379396 () Bool)

(declare-fun e!781401 () Bool)

(declare-fun e!781402 () Bool)

(assert (=> b!1379396 (= e!781401 e!781402)))

(declare-fun res!921834 () Bool)

(assert (=> b!1379396 (=> (not res!921834) (not e!781402))))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun lt!607412 () (_ BitVec 32))

(declare-fun lt!607413 () (_ BitVec 32))

(assert (=> b!1379396 (= res!921834 (and (= lt!607412 (bvsub lt!607413 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-datatypes ((array!93836 0))(
  ( (array!93837 (arr!45317 (Array (_ BitVec 32) (_ BitVec 64))) (size!45867 (_ BitVec 32))) )
))
(declare-fun lt!607417 () array!93836)

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93836 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379396 (= lt!607412 (arrayCountValidKeys!0 lt!607417 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun a!4094 () array!93836)

(assert (=> b!1379396 (= lt!607413 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379396 (= lt!607417 (array!93837 (store (arr!45317 a!4094) i!1451 k!2953) (size!45867 a!4094)))))

(declare-fun res!921837 () Bool)

(assert (=> start!117240 (=> (not res!921837) (not e!781401))))

(assert (=> start!117240 (= res!921837 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45867 a!4094))))))

(assert (=> start!117240 e!781401))

(assert (=> start!117240 true))

(declare-fun array_inv!34345 (array!93836) Bool)

(assert (=> start!117240 (array_inv!34345 a!4094)))

(declare-fun b!1379397 () Bool)

(declare-fun res!921836 () Bool)

(assert (=> b!1379397 (=> (not res!921836) (not e!781401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379397 (= res!921836 (validKeyInArray!0 (select (arr!45317 a!4094) i!1451)))))

(declare-fun b!1379398 () Bool)

(declare-fun res!921838 () Bool)

(assert (=> b!1379398 (=> (not res!921838) (not e!781401))))

(assert (=> b!1379398 (= res!921838 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379399 () Bool)

(declare-fun lt!607418 () (_ BitVec 32))

(declare-fun lt!607419 () (_ BitVec 32))

(assert (=> b!1379399 (= e!781402 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45867 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607419 (bvsub lt!607418 #b00000000000000000000000000000001))) (bvslt (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))))

(declare-fun lt!607411 () (_ BitVec 32))

(assert (=> b!1379399 (= (bvadd lt!607411 lt!607412) lt!607419)))

(assert (=> b!1379399 (= lt!607419 (arrayCountValidKeys!0 lt!607417 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379399 (= lt!607411 (arrayCountValidKeys!0 lt!607417 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45861 0))(
  ( (Unit!45862) )
))
(declare-fun lt!607416 () Unit!45861)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45861)

(assert (=> b!1379399 (= lt!607416 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607417 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607415 () (_ BitVec 32))

(assert (=> b!1379399 (= (bvadd lt!607415 lt!607413) lt!607418)))

(assert (=> b!1379399 (= lt!607418 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379399 (= lt!607415 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607414 () Unit!45861)

(assert (=> b!1379399 (= lt!607414 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379400 () Bool)

(declare-fun res!921835 () Bool)

(assert (=> b!1379400 (=> (not res!921835) (not e!781401))))

(assert (=> b!1379400 (= res!921835 (and (bvslt (size!45867 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45867 a!4094)) (bvsge i!1451 from!3466)))))

(assert (= (and start!117240 res!921837) b!1379397))

(assert (= (and b!1379397 res!921836) b!1379398))

(assert (= (and b!1379398 res!921838) b!1379400))

(assert (= (and b!1379400 res!921835) b!1379396))

(assert (= (and b!1379396 res!921834) b!1379399))

(declare-fun m!1264431 () Bool)

(assert (=> b!1379397 m!1264431))

(assert (=> b!1379397 m!1264431))

(declare-fun m!1264433 () Bool)

(assert (=> b!1379397 m!1264433))

(declare-fun m!1264435 () Bool)

(assert (=> b!1379399 m!1264435))

(declare-fun m!1264437 () Bool)

(assert (=> b!1379399 m!1264437))

(declare-fun m!1264439 () Bool)

(assert (=> b!1379399 m!1264439))

(declare-fun m!1264441 () Bool)

(assert (=> b!1379399 m!1264441))

(declare-fun m!1264443 () Bool)

(assert (=> b!1379399 m!1264443))

(declare-fun m!1264445 () Bool)

(assert (=> b!1379399 m!1264445))

(declare-fun m!1264447 () Bool)

(assert (=> b!1379396 m!1264447))

(declare-fun m!1264449 () Bool)

(assert (=> b!1379396 m!1264449))

(declare-fun m!1264451 () Bool)

(assert (=> b!1379396 m!1264451))

(declare-fun m!1264453 () Bool)

(assert (=> start!117240 m!1264453))

(declare-fun m!1264455 () Bool)

(assert (=> b!1379398 m!1264455))

(push 1)

(assert (not b!1379396))

(assert (not start!117240))

(assert (not b!1379398))

(assert (not b!1379397))

(assert (not b!1379399))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

