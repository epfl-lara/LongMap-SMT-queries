; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117130 () Bool)

(assert start!117130)

(declare-fun b!1378663 () Bool)

(declare-fun e!781021 () Bool)

(declare-fun e!781022 () Bool)

(assert (=> b!1378663 (= e!781021 (not e!781022))))

(declare-fun res!921197 () Bool)

(assert (=> b!1378663 (=> res!921197 e!781022)))

(declare-datatypes ((array!93747 0))(
  ( (array!93748 (arr!45274 (Array (_ BitVec 32) (_ BitVec 64))) (size!45824 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93747)

(declare-fun lt!606956 () (_ BitVec 32))

(declare-fun lt!606952 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1378663 (= res!921197 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45824 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606956 (bvsub lt!606952 #b00000000000000000000000000000001)))))))

(declare-fun lt!606951 () (_ BitVec 32))

(declare-fun lt!606953 () (_ BitVec 32))

(assert (=> b!1378663 (= (bvadd lt!606951 lt!606953) lt!606956)))

(declare-fun lt!606959 () array!93747)

(declare-fun arrayCountValidKeys!0 (array!93747 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378663 (= lt!606956 (arrayCountValidKeys!0 lt!606959 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378663 (= lt!606951 (arrayCountValidKeys!0 lt!606959 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45811 0))(
  ( (Unit!45812) )
))
(declare-fun lt!606954 () Unit!45811)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45811)

(assert (=> b!1378663 (= lt!606954 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606959 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606955 () (_ BitVec 32))

(declare-fun lt!606960 () (_ BitVec 32))

(assert (=> b!1378663 (= (bvadd lt!606955 lt!606960) lt!606952)))

(assert (=> b!1378663 (= lt!606952 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378663 (= lt!606955 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606957 () Unit!45811)

(assert (=> b!1378663 (= lt!606957 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun res!921201 () Bool)

(declare-fun e!781020 () Bool)

(assert (=> start!117130 (=> (not res!921201) (not e!781020))))

(assert (=> start!117130 (= res!921201 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45824 a!4094))))))

(assert (=> start!117130 e!781020))

(assert (=> start!117130 true))

(declare-fun array_inv!34302 (array!93747) Bool)

(assert (=> start!117130 (array_inv!34302 a!4094)))

(declare-fun b!1378664 () Bool)

(declare-fun res!921199 () Bool)

(assert (=> b!1378664 (=> (not res!921199) (not e!781020))))

(assert (=> b!1378664 (= res!921199 (and (bvslt (size!45824 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45824 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378665 () Bool)

(assert (=> b!1378665 (= e!781020 e!781021)))

(declare-fun res!921200 () Bool)

(assert (=> b!1378665 (=> (not res!921200) (not e!781021))))

(assert (=> b!1378665 (= res!921200 (and (= lt!606953 (bvsub lt!606960 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378665 (= lt!606953 (arrayCountValidKeys!0 lt!606959 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378665 (= lt!606960 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1378665 (= lt!606959 (array!93748 (store (arr!45274 a!4094) i!1451 k!2953) (size!45824 a!4094)))))

(declare-fun b!1378666 () Bool)

(declare-fun res!921202 () Bool)

(assert (=> b!1378666 (=> (not res!921202) (not e!781020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378666 (= res!921202 (validKeyInArray!0 (select (arr!45274 a!4094) i!1451)))))

(declare-fun b!1378667 () Bool)

(assert (=> b!1378667 (= e!781022 true)))

(assert (=> b!1378667 (= (arrayCountValidKeys!0 lt!606959 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606958 () Unit!45811)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45811)

(assert (=> b!1378667 (= lt!606958 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378668 () Bool)

(declare-fun res!921198 () Bool)

(assert (=> b!1378668 (=> (not res!921198) (not e!781020))))

(assert (=> b!1378668 (= res!921198 (not (validKeyInArray!0 k!2953)))))

(assert (= (and start!117130 res!921201) b!1378666))

(assert (= (and b!1378666 res!921202) b!1378668))

(assert (= (and b!1378668 res!921198) b!1378664))

(assert (= (and b!1378664 res!921199) b!1378665))

(assert (= (and b!1378665 res!921200) b!1378663))

(assert (= (and b!1378663 (not res!921197)) b!1378667))

(declare-fun m!1263463 () Bool)

(assert (=> b!1378668 m!1263463))

(declare-fun m!1263465 () Bool)

(assert (=> b!1378666 m!1263465))

(assert (=> b!1378666 m!1263465))

(declare-fun m!1263467 () Bool)

(assert (=> b!1378666 m!1263467))

(declare-fun m!1263469 () Bool)

(assert (=> b!1378663 m!1263469))

(declare-fun m!1263471 () Bool)

(assert (=> b!1378663 m!1263471))

(declare-fun m!1263473 () Bool)

(assert (=> b!1378663 m!1263473))

(declare-fun m!1263475 () Bool)

(assert (=> b!1378663 m!1263475))

(declare-fun m!1263477 () Bool)

(assert (=> b!1378663 m!1263477))

(declare-fun m!1263479 () Bool)

(assert (=> b!1378663 m!1263479))

(declare-fun m!1263481 () Bool)

(assert (=> b!1378667 m!1263481))

(declare-fun m!1263483 () Bool)

(assert (=> b!1378667 m!1263483))

(declare-fun m!1263485 () Bool)

(assert (=> b!1378667 m!1263485))

(declare-fun m!1263487 () Bool)

(assert (=> start!117130 m!1263487))

(declare-fun m!1263489 () Bool)

(assert (=> b!1378665 m!1263489))

(declare-fun m!1263491 () Bool)

(assert (=> b!1378665 m!1263491))

(declare-fun m!1263493 () Bool)

(assert (=> b!1378665 m!1263493))

(push 1)

(assert (not b!1378667))

(assert (not start!117130))

(assert (not b!1378666))

(assert (not b!1378665))

(assert (not b!1378668))

(assert (not b!1378663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

