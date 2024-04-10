; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117108 () Bool)

(assert start!117108)

(declare-fun b!1378465 () Bool)

(declare-fun res!920999 () Bool)

(declare-fun e!780888 () Bool)

(assert (=> b!1378465 (=> (not res!920999) (not e!780888))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378465 (= res!920999 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1378466 () Bool)

(declare-fun e!780890 () Bool)

(declare-fun e!780889 () Bool)

(assert (=> b!1378466 (= e!780890 (not e!780889))))

(declare-fun res!921002 () Bool)

(assert (=> b!1378466 (=> res!921002 e!780889)))

(declare-datatypes ((array!93725 0))(
  ( (array!93726 (arr!45263 (Array (_ BitVec 32) (_ BitVec 64))) (size!45813 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93725)

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun i!1451 () (_ BitVec 32))

(declare-fun lt!606627 () (_ BitVec 32))

(declare-fun lt!606622 () (_ BitVec 32))

(assert (=> b!1378466 (= res!921002 (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45813 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (not (= lt!606627 (bvsub lt!606622 #b00000000000000000000000000000001)))))))

(declare-fun lt!606625 () (_ BitVec 32))

(declare-fun lt!606621 () (_ BitVec 32))

(assert (=> b!1378466 (= (bvadd lt!606625 lt!606621) lt!606627)))

(declare-fun lt!606628 () array!93725)

(declare-fun arrayCountValidKeys!0 (array!93725 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378466 (= lt!606627 (arrayCountValidKeys!0 lt!606628 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378466 (= lt!606625 (arrayCountValidKeys!0 lt!606628 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45789 0))(
  ( (Unit!45790) )
))
(declare-fun lt!606626 () Unit!45789)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45789)

(assert (=> b!1378466 (= lt!606626 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!606628 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!606623 () (_ BitVec 32))

(declare-fun lt!606629 () (_ BitVec 32))

(assert (=> b!1378466 (= (bvadd lt!606623 lt!606629) lt!606622)))

(assert (=> b!1378466 (= lt!606622 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378466 (= lt!606623 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!606630 () Unit!45789)

(assert (=> b!1378466 (= lt!606630 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1378467 () Bool)

(declare-fun res!921004 () Bool)

(assert (=> b!1378467 (=> (not res!921004) (not e!780888))))

(assert (=> b!1378467 (= res!921004 (and (bvslt (size!45813 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45813 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1378468 () Bool)

(assert (=> b!1378468 (= e!780889 (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378468 (= (arrayCountValidKeys!0 lt!606628 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsub (arrayCountValidKeys!0 a!4094 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1451)) #b00000000000000000000000000000001))))

(declare-fun lt!606624 () Unit!45789)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93725 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45789)

(assert (=> b!1378468 (= lt!606624 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4094 i!1451 k!2953 (bvsub from!3466 #b00000000000000000000000000000001)))))

(declare-fun b!1378469 () Bool)

(declare-fun res!921001 () Bool)

(assert (=> b!1378469 (=> (not res!921001) (not e!780888))))

(assert (=> b!1378469 (= res!921001 (validKeyInArray!0 (select (arr!45263 a!4094) i!1451)))))

(declare-fun b!1378470 () Bool)

(assert (=> b!1378470 (= e!780888 e!780890)))

(declare-fun res!921000 () Bool)

(assert (=> b!1378470 (=> (not res!921000) (not e!780890))))

(assert (=> b!1378470 (= res!921000 (and (= lt!606621 (bvsub lt!606629 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1378470 (= lt!606621 (arrayCountValidKeys!0 lt!606628 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378470 (= lt!606629 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1378470 (= lt!606628 (array!93726 (store (arr!45263 a!4094) i!1451 k!2953) (size!45813 a!4094)))))

(declare-fun res!921003 () Bool)

(assert (=> start!117108 (=> (not res!921003) (not e!780888))))

(assert (=> start!117108 (= res!921003 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45813 a!4094))))))

(assert (=> start!117108 e!780888))

(assert (=> start!117108 true))

(declare-fun array_inv!34291 (array!93725) Bool)

(assert (=> start!117108 (array_inv!34291 a!4094)))

(assert (= (and start!117108 res!921003) b!1378469))

(assert (= (and b!1378469 res!921001) b!1378465))

(assert (= (and b!1378465 res!920999) b!1378467))

(assert (= (and b!1378467 res!921004) b!1378470))

(assert (= (and b!1378470 res!921000) b!1378466))

(assert (= (and b!1378466 (not res!921002)) b!1378468))

(declare-fun m!1263111 () Bool)

(assert (=> b!1378468 m!1263111))

(declare-fun m!1263113 () Bool)

(assert (=> b!1378468 m!1263113))

(declare-fun m!1263115 () Bool)

(assert (=> b!1378468 m!1263115))

(declare-fun m!1263117 () Bool)

(assert (=> b!1378469 m!1263117))

(assert (=> b!1378469 m!1263117))

(declare-fun m!1263119 () Bool)

(assert (=> b!1378469 m!1263119))

(declare-fun m!1263121 () Bool)

(assert (=> b!1378465 m!1263121))

(declare-fun m!1263123 () Bool)

(assert (=> start!117108 m!1263123))

(declare-fun m!1263125 () Bool)

(assert (=> b!1378466 m!1263125))

(declare-fun m!1263127 () Bool)

(assert (=> b!1378466 m!1263127))

(declare-fun m!1263129 () Bool)

(assert (=> b!1378466 m!1263129))

(declare-fun m!1263131 () Bool)

(assert (=> b!1378466 m!1263131))

(declare-fun m!1263133 () Bool)

(assert (=> b!1378466 m!1263133))

(declare-fun m!1263135 () Bool)

(assert (=> b!1378466 m!1263135))

(declare-fun m!1263137 () Bool)

(assert (=> b!1378470 m!1263137))

(declare-fun m!1263139 () Bool)

(assert (=> b!1378470 m!1263139))

(declare-fun m!1263141 () Bool)

(assert (=> b!1378470 m!1263141))

(push 1)

(assert (not start!117108))

(assert (not b!1378468))

(assert (not b!1378465))

(assert (not b!1378470))

(assert (not b!1378469))

(assert (not b!1378466))

(check-sat)

