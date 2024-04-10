; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36304 () Bool)

(assert start!36304)

(declare-fun b!363395 () Bool)

(declare-fun res!202557 () Bool)

(declare-fun e!222508 () Bool)

(assert (=> b!363395 (=> (not res!202557) (not e!222508))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363395 (= res!202557 (validKeyInArray!0 k!2980))))

(declare-fun b!363394 () Bool)

(declare-fun res!202556 () Bool)

(assert (=> b!363394 (=> (not res!202556) (not e!222508))))

(declare-datatypes ((array!20584 0))(
  ( (array!20585 (arr!9771 (Array (_ BitVec 32) (_ BitVec 64))) (size!10123 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20584)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363394 (= res!202556 (not (validKeyInArray!0 (select (arr!9771 a!4337) i!1478))))))

(declare-fun b!363397 () Bool)

(assert (=> b!363397 (= e!222508 (not true))))

(declare-fun lt!167514 () (_ BitVec 32))

(declare-fun lt!167515 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20584 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363397 (= (bvadd lt!167514 lt!167515) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10123 a!4337)))))

(declare-datatypes ((Unit!11230 0))(
  ( (Unit!11231) )
))
(declare-fun lt!167512 () Unit!11230)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20584 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11230)

(assert (=> b!363397 (= lt!167512 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10123 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167513 () (_ BitVec 32))

(assert (=> b!363397 (= lt!167513 lt!167515)))

(assert (=> b!363397 (= lt!167515 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10123 a!4337)))))

(declare-fun lt!167517 () array!20584)

(assert (=> b!363397 (= lt!167513 (arrayCountValidKeys!0 lt!167517 (bvadd #b00000000000000000000000000000001 i!1478) (size!10123 a!4337)))))

(declare-fun lt!167518 () Unit!11230)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11230)

(assert (=> b!363397 (= lt!167518 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363397 (= (arrayCountValidKeys!0 lt!167517 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167514))))

(assert (=> b!363397 (= lt!167514 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363397 (= lt!167517 (array!20585 (store (arr!9771 a!4337) i!1478 k!2980) (size!10123 a!4337)))))

(declare-fun lt!167516 () Unit!11230)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11230)

(assert (=> b!363397 (= lt!167516 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun res!202558 () Bool)

(assert (=> start!36304 (=> (not res!202558) (not e!222508))))

(assert (=> start!36304 (= res!202558 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10123 a!4337))))))

(assert (=> start!36304 e!222508))

(assert (=> start!36304 true))

(declare-fun array_inv!7213 (array!20584) Bool)

(assert (=> start!36304 (array_inv!7213 a!4337)))

(declare-fun b!363396 () Bool)

(declare-fun res!202555 () Bool)

(assert (=> b!363396 (=> (not res!202555) (not e!222508))))

(assert (=> b!363396 (= res!202555 (bvslt (size!10123 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36304 res!202558) b!363394))

(assert (= (and b!363394 res!202556) b!363395))

(assert (= (and b!363395 res!202557) b!363396))

(assert (= (and b!363396 res!202555) b!363397))

(declare-fun m!360375 () Bool)

(assert (=> b!363395 m!360375))

(declare-fun m!360377 () Bool)

(assert (=> b!363394 m!360377))

(assert (=> b!363394 m!360377))

(declare-fun m!360379 () Bool)

(assert (=> b!363394 m!360379))

(declare-fun m!360381 () Bool)

(assert (=> b!363397 m!360381))

(declare-fun m!360383 () Bool)

(assert (=> b!363397 m!360383))

(declare-fun m!360385 () Bool)

(assert (=> b!363397 m!360385))

(declare-fun m!360387 () Bool)

(assert (=> b!363397 m!360387))

(declare-fun m!360389 () Bool)

(assert (=> b!363397 m!360389))

(declare-fun m!360391 () Bool)

(assert (=> b!363397 m!360391))

(declare-fun m!360393 () Bool)

(assert (=> b!363397 m!360393))

(declare-fun m!360395 () Bool)

(assert (=> b!363397 m!360395))

(declare-fun m!360397 () Bool)

(assert (=> b!363397 m!360397))

(declare-fun m!360399 () Bool)

(assert (=> start!36304 m!360399))

(push 1)

(assert (not start!36304))

(assert (not b!363394))

(assert (not b!363397))

(assert (not b!363395))

(check-sat)

(pop 1)

(push 1)

