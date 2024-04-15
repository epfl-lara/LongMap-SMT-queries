; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117244 () Bool)

(assert start!117244)

(declare-fun res!921875 () Bool)

(declare-fun e!781413 () Bool)

(assert (=> start!117244 (=> (not res!921875) (not e!781413))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93794 0))(
  ( (array!93795 (arr!45296 (Array (_ BitVec 32) (_ BitVec 64))) (size!45848 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93794)

(assert (=> start!117244 (= res!921875 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45848 a!4094))))))

(assert (=> start!117244 e!781413))

(assert (=> start!117244 true))

(declare-fun array_inv!34529 (array!93794) Bool)

(assert (=> start!117244 (array_inv!34529 a!4094)))

(declare-fun b!1379392 () Bool)

(declare-fun res!921873 () Bool)

(assert (=> b!1379392 (=> (not res!921873) (not e!781413))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379392 (= res!921873 (and (bvslt (size!45848 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45848 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379393 () Bool)

(declare-fun e!781414 () Bool)

(declare-fun e!781412 () Bool)

(assert (=> b!1379393 (= e!781414 (not e!781412))))

(declare-fun res!921874 () Bool)

(assert (=> b!1379393 (=> res!921874 e!781412)))

(declare-fun lt!607343 () (_ BitVec 32))

(declare-fun lt!607342 () (_ BitVec 32))

(assert (=> b!1379393 (= res!921874 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45848 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!607342 (bvsub lt!607343 #b00000000000000000000000000000001)))))))

(declare-fun lt!607349 () (_ BitVec 32))

(declare-fun lt!607340 () (_ BitVec 32))

(assert (=> b!1379393 (= (bvadd lt!607349 lt!607340) lt!607342)))

(declare-fun lt!607346 () array!93794)

(declare-fun arrayCountValidKeys!0 (array!93794 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379393 (= lt!607342 (arrayCountValidKeys!0 lt!607346 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379393 (= lt!607349 (arrayCountValidKeys!0 lt!607346 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45710 0))(
  ( (Unit!45711) )
))
(declare-fun lt!607345 () Unit!45710)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45710)

(assert (=> b!1379393 (= lt!607345 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607346 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607348 () (_ BitVec 32))

(declare-fun lt!607347 () (_ BitVec 32))

(assert (=> b!1379393 (= (bvadd lt!607348 lt!607347) lt!607343)))

(assert (=> b!1379393 (= lt!607343 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379393 (= lt!607348 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607341 () Unit!45710)

(assert (=> b!1379393 (= lt!607341 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379394 () Bool)

(assert (=> b!1379394 (= e!781413 e!781414)))

(declare-fun res!921878 () Bool)

(assert (=> b!1379394 (=> (not res!921878) (not e!781414))))

(assert (=> b!1379394 (= res!921878 (and (= lt!607340 (bvsub lt!607347 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379394 (= lt!607340 (arrayCountValidKeys!0 lt!607346 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379394 (= lt!607347 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun k!2953 () (_ BitVec 64))

(assert (=> b!1379394 (= lt!607346 (array!93795 (store (arr!45296 a!4094) i!1451 k!2953) (size!45848 a!4094)))))

(declare-fun b!1379395 () Bool)

(declare-fun res!921876 () Bool)

(assert (=> b!1379395 (=> (not res!921876) (not e!781413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379395 (= res!921876 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379396 () Bool)

(assert (=> b!1379396 (= e!781412 true)))

(assert (=> b!1379396 (= (arrayCountValidKeys!0 lt!607346 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!607344 () Unit!45710)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93794 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45710)

(assert (=> b!1379396 (= lt!607344 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1379397 () Bool)

(declare-fun res!921877 () Bool)

(assert (=> b!1379397 (=> (not res!921877) (not e!781413))))

(assert (=> b!1379397 (= res!921877 (validKeyInArray!0 (select (arr!45296 a!4094) i!1451)))))

(assert (= (and start!117244 res!921875) b!1379397))

(assert (= (and b!1379397 res!921877) b!1379395))

(assert (= (and b!1379395 res!921876) b!1379392))

(assert (= (and b!1379392 res!921873) b!1379394))

(assert (= (and b!1379394 res!921878) b!1379393))

(assert (= (and b!1379393 (not res!921874)) b!1379396))

(declare-fun m!1264037 () Bool)

(assert (=> b!1379393 m!1264037))

(declare-fun m!1264039 () Bool)

(assert (=> b!1379393 m!1264039))

(declare-fun m!1264041 () Bool)

(assert (=> b!1379393 m!1264041))

(declare-fun m!1264043 () Bool)

(assert (=> b!1379393 m!1264043))

(declare-fun m!1264045 () Bool)

(assert (=> b!1379393 m!1264045))

(declare-fun m!1264047 () Bool)

(assert (=> b!1379393 m!1264047))

(declare-fun m!1264049 () Bool)

(assert (=> b!1379396 m!1264049))

(declare-fun m!1264051 () Bool)

(assert (=> b!1379396 m!1264051))

(declare-fun m!1264053 () Bool)

(assert (=> b!1379396 m!1264053))

(declare-fun m!1264055 () Bool)

(assert (=> b!1379397 m!1264055))

(assert (=> b!1379397 m!1264055))

(declare-fun m!1264057 () Bool)

(assert (=> b!1379397 m!1264057))

(declare-fun m!1264059 () Bool)

(assert (=> b!1379394 m!1264059))

(declare-fun m!1264061 () Bool)

(assert (=> b!1379394 m!1264061))

(declare-fun m!1264063 () Bool)

(assert (=> b!1379394 m!1264063))

(declare-fun m!1264065 () Bool)

(assert (=> b!1379395 m!1264065))

(declare-fun m!1264067 () Bool)

(assert (=> start!117244 m!1264067))

(push 1)

(assert (not b!1379394))

(assert (not b!1379393))

(assert (not b!1379397))

(assert (not start!117244))

(assert (not b!1379396))

(assert (not b!1379395))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

