; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36192 () Bool)

(assert start!36192)

(declare-fun b!362812 () Bool)

(declare-fun e!222190 () Bool)

(declare-fun e!222191 () Bool)

(assert (=> b!362812 (= e!222190 (not e!222191))))

(declare-fun res!202101 () Bool)

(assert (=> b!362812 (=> res!202101 e!222191)))

(declare-datatypes ((array!20508 0))(
  ( (array!20509 (arr!9736 (Array (_ BitVec 32) (_ BitVec 64))) (size!10088 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20508)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362812 (= res!202101 (or (bvslt (size!10088 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167110 () (_ BitVec 32))

(declare-fun lt!167112 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20508 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362812 (= (bvadd lt!167110 lt!167112) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10088 a!4337)))))

(declare-datatypes ((Unit!11172 0))(
  ( (Unit!11173) )
))
(declare-fun lt!167115 () Unit!11172)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11172)

(assert (=> b!362812 (= lt!167115 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10088 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167109 () (_ BitVec 32))

(assert (=> b!362812 (= lt!167109 lt!167112)))

(assert (=> b!362812 (= lt!167112 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10088 a!4337)))))

(declare-fun lt!167117 () array!20508)

(assert (=> b!362812 (= lt!167109 (arrayCountValidKeys!0 lt!167117 (bvadd #b00000000000000000000000000000001 i!1478) (size!10088 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167116 () Unit!11172)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11172)

(assert (=> b!362812 (= lt!167116 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167114 () (_ BitVec 32))

(assert (=> b!362812 (= lt!167114 (bvadd #b00000000000000000000000000000001 lt!167110))))

(assert (=> b!362812 (= lt!167114 (arrayCountValidKeys!0 lt!167117 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362812 (= lt!167110 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362812 (= lt!167117 (array!20509 (store (arr!9736 a!4337) i!1478 k!2980) (size!10088 a!4337)))))

(declare-fun lt!167111 () Unit!11172)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11172)

(assert (=> b!362812 (= lt!167111 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202102 () Bool)

(assert (=> start!36192 (=> (not res!202102) (not e!222190))))

(assert (=> start!36192 (= res!202102 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10088 a!4337))))))

(assert (=> start!36192 e!222190))

(assert (=> start!36192 true))

(declare-fun array_inv!7178 (array!20508) Bool)

(assert (=> start!36192 (array_inv!7178 a!4337)))

(declare-fun b!362813 () Bool)

(declare-fun res!202103 () Bool)

(assert (=> b!362813 (=> (not res!202103) (not e!222190))))

(assert (=> b!362813 (= res!202103 (bvslt (size!10088 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362814 () Bool)

(declare-fun res!202104 () Bool)

(assert (=> b!362814 (=> (not res!202104) (not e!222190))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362814 (= res!202104 (not (validKeyInArray!0 (select (arr!9736 a!4337) i!1478))))))

(declare-fun b!362815 () Bool)

(declare-fun res!202105 () Bool)

(assert (=> b!362815 (=> (not res!202105) (not e!222190))))

(assert (=> b!362815 (= res!202105 (validKeyInArray!0 k!2980))))

(declare-fun b!362816 () Bool)

(assert (=> b!362816 (= e!222191 true)))

(assert (=> b!362816 (= (bvadd lt!167114 lt!167109) (arrayCountValidKeys!0 lt!167117 #b00000000000000000000000000000000 (size!10088 a!4337)))))

(declare-fun lt!167113 () Unit!11172)

(assert (=> b!362816 (= lt!167113 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167117 #b00000000000000000000000000000000 (size!10088 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36192 res!202102) b!362814))

(assert (= (and b!362814 res!202104) b!362815))

(assert (= (and b!362815 res!202105) b!362813))

(assert (= (and b!362813 res!202103) b!362812))

(assert (= (and b!362812 (not res!202101)) b!362816))

(declare-fun m!359543 () Bool)

(assert (=> b!362816 m!359543))

(declare-fun m!359545 () Bool)

(assert (=> b!362816 m!359545))

(declare-fun m!359547 () Bool)

(assert (=> start!36192 m!359547))

(declare-fun m!359549 () Bool)

(assert (=> b!362812 m!359549))

(declare-fun m!359551 () Bool)

(assert (=> b!362812 m!359551))

(declare-fun m!359553 () Bool)

(assert (=> b!362812 m!359553))

(declare-fun m!359555 () Bool)

(assert (=> b!362812 m!359555))

(declare-fun m!359557 () Bool)

(assert (=> b!362812 m!359557))

(declare-fun m!359559 () Bool)

(assert (=> b!362812 m!359559))

(declare-fun m!359561 () Bool)

(assert (=> b!362812 m!359561))

(declare-fun m!359563 () Bool)

(assert (=> b!362812 m!359563))

(declare-fun m!359565 () Bool)

(assert (=> b!362812 m!359565))

(declare-fun m!359567 () Bool)

(assert (=> b!362815 m!359567))

(declare-fun m!359569 () Bool)

(assert (=> b!362814 m!359569))

(assert (=> b!362814 m!359569))

(declare-fun m!359571 () Bool)

(assert (=> b!362814 m!359571))

(push 1)

(assert (not b!362816))

(assert (not b!362812))

(assert (not b!362814))

(assert (not b!362815))

(assert (not start!36192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

