; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117250 () Bool)

(assert start!117250)

(declare-fun b!1379479 () Bool)

(declare-fun e!781454 () Bool)

(declare-fun e!781456 () Bool)

(assert (=> b!1379479 (= e!781454 (not e!781456))))

(declare-fun res!921921 () Bool)

(assert (=> b!1379479 (=> res!921921 e!781456)))

(declare-fun lt!607557 () (_ BitVec 32))

(declare-fun lt!607563 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93846 0))(
  ( (array!93847 (arr!45322 (Array (_ BitVec 32) (_ BitVec 64))) (size!45872 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93846)

(assert (=> b!1379479 (= res!921921 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45872 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607557 (bvsub lt!607563 #b00000000000000000000000000000001)))))))

(declare-fun lt!607562 () (_ BitVec 32))

(declare-fun lt!607560 () (_ BitVec 32))

(assert (=> b!1379479 (= (bvadd lt!607562 lt!607560) lt!607557)))

(declare-fun lt!607559 () array!93846)

(declare-fun arrayCountValidKeys!0 (array!93846 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379479 (= lt!607557 (arrayCountValidKeys!0 lt!607559 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379479 (= lt!607562 (arrayCountValidKeys!0 lt!607559 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45871 0))(
  ( (Unit!45872) )
))
(declare-fun lt!607555 () Unit!45871)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45871)

(assert (=> b!1379479 (= lt!607555 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607559 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607554 () (_ BitVec 32))

(declare-fun lt!607556 () (_ BitVec 32))

(assert (=> b!1379479 (= (bvadd lt!607554 lt!607556) lt!607563)))

(assert (=> b!1379479 (= lt!607563 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379479 (= lt!607554 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607561 () Unit!45871)

(assert (=> b!1379479 (= lt!607561 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379480 () Bool)

(declare-fun res!921920 () Bool)

(declare-fun e!781457 () Bool)

(assert (=> b!1379480 (=> (not res!921920) (not e!781457))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379480 (= res!921920 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379481 () Bool)

(assert (=> b!1379481 (= e!781457 e!781454)))

(declare-fun res!921918 () Bool)

(assert (=> b!1379481 (=> (not res!921918) (not e!781454))))

(assert (=> b!1379481 (= res!921918 (and (= lt!607560 (bvsub lt!607556 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379481 (= lt!607560 (arrayCountValidKeys!0 lt!607559 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379481 (= lt!607556 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379481 (= lt!607559 (array!93847 (store (arr!45322 a!4094) i!1451 k!2953) (size!45872 a!4094)))))

(declare-fun b!1379482 () Bool)

(assert (=> b!1379482 (= e!781456 true)))

(assert (=> b!1379482 (= (arrayCountValidKeys!0 lt!607559 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607558 () Unit!45871)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93846 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45871)

(assert (=> b!1379482 (= lt!607558 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379483 () Bool)

(declare-fun res!921917 () Bool)

(assert (=> b!1379483 (=> (not res!921917) (not e!781457))))

(assert (=> b!1379483 (= res!921917 (and (bvslt (size!45872 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45872 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379484 () Bool)

(declare-fun res!921922 () Bool)

(assert (=> b!1379484 (=> (not res!921922) (not e!781457))))

(assert (=> b!1379484 (= res!921922 (validKeyInArray!0 (select (arr!45322 a!4094) i!1451)))))

(declare-fun res!921919 () Bool)

(assert (=> start!117250 (=> (not res!921919) (not e!781457))))

(assert (=> start!117250 (= res!921919 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45872 a!4094))))))

(assert (=> start!117250 e!781457))

(assert (=> start!117250 true))

(declare-fun array_inv!34350 (array!93846) Bool)

(assert (=> start!117250 (array_inv!34350 a!4094)))

(assert (= (and start!117250 res!921919) b!1379484))

(assert (= (and b!1379484 res!921922) b!1379480))

(assert (= (and b!1379480 res!921920) b!1379483))

(assert (= (and b!1379483 res!921917) b!1379481))

(assert (= (and b!1379481 res!921918) b!1379479))

(assert (= (and b!1379479 (not res!921921)) b!1379482))

(declare-fun m!1264573 () Bool)

(assert (=> b!1379481 m!1264573))

(declare-fun m!1264575 () Bool)

(assert (=> b!1379481 m!1264575))

(declare-fun m!1264577 () Bool)

(assert (=> b!1379481 m!1264577))

(declare-fun m!1264579 () Bool)

(assert (=> b!1379484 m!1264579))

(assert (=> b!1379484 m!1264579))

(declare-fun m!1264581 () Bool)

(assert (=> b!1379484 m!1264581))

(declare-fun m!1264583 () Bool)

(assert (=> b!1379482 m!1264583))

(declare-fun m!1264585 () Bool)

(assert (=> b!1379482 m!1264585))

(declare-fun m!1264587 () Bool)

(assert (=> b!1379482 m!1264587))

(declare-fun m!1264589 () Bool)

(assert (=> b!1379479 m!1264589))

(declare-fun m!1264591 () Bool)

(assert (=> b!1379479 m!1264591))

(declare-fun m!1264593 () Bool)

(assert (=> b!1379479 m!1264593))

(declare-fun m!1264595 () Bool)

(assert (=> b!1379479 m!1264595))

(declare-fun m!1264597 () Bool)

(assert (=> b!1379479 m!1264597))

(declare-fun m!1264599 () Bool)

(assert (=> b!1379479 m!1264599))

(declare-fun m!1264601 () Bool)

(assert (=> start!117250 m!1264601))

(declare-fun m!1264603 () Bool)

(assert (=> b!1379480 m!1264603))

(push 1)

(assert (not start!117250))

(assert (not b!1379482))

(assert (not b!1379479))

(assert (not b!1379481))

(assert (not b!1379484))

(assert (not b!1379480))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

