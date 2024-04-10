; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36306 () Bool)

(assert start!36306)

(declare-fun res!202568 () Bool)

(declare-fun e!222513 () Bool)

(assert (=> start!36306 (=> (not res!202568) (not e!222513))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20586 0))(
  ( (array!20587 (arr!9772 (Array (_ BitVec 32) (_ BitVec 64))) (size!10124 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20586)

(assert (=> start!36306 (= res!202568 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10124 a!4337))))))

(assert (=> start!36306 e!222513))

(assert (=> start!36306 true))

(declare-fun array_inv!7214 (array!20586) Bool)

(assert (=> start!36306 (array_inv!7214 a!4337)))

(declare-fun b!363409 () Bool)

(assert (=> b!363409 (= e!222513 (not (and (bvsge (size!10124 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167535 () (_ BitVec 32))

(declare-fun lt!167536 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20586 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363409 (= (bvadd lt!167535 lt!167536) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10124 a!4337)))))

(declare-datatypes ((Unit!11232 0))(
  ( (Unit!11233) )
))
(declare-fun lt!167538 () Unit!11232)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11232)

(assert (=> b!363409 (= lt!167538 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10124 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167539 () (_ BitVec 32))

(assert (=> b!363409 (= lt!167539 lt!167536)))

(assert (=> b!363409 (= lt!167536 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10124 a!4337)))))

(declare-fun lt!167534 () array!20586)

(assert (=> b!363409 (= lt!167539 (arrayCountValidKeys!0 lt!167534 (bvadd #b00000000000000000000000000000001 i!1478) (size!10124 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167533 () Unit!11232)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11232)

(assert (=> b!363409 (= lt!167533 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363409 (= (arrayCountValidKeys!0 lt!167534 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167535))))

(assert (=> b!363409 (= lt!167535 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363409 (= lt!167534 (array!20587 (store (arr!9772 a!4337) i!1478 k!2980) (size!10124 a!4337)))))

(declare-fun lt!167537 () Unit!11232)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11232)

(assert (=> b!363409 (= lt!167537 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363407 () Bool)

(declare-fun res!202567 () Bool)

(assert (=> b!363407 (=> (not res!202567) (not e!222513))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363407 (= res!202567 (validKeyInArray!0 k!2980))))

(declare-fun b!363408 () Bool)

(declare-fun res!202570 () Bool)

(assert (=> b!363408 (=> (not res!202570) (not e!222513))))

(assert (=> b!363408 (= res!202570 (bvslt (size!10124 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363406 () Bool)

(declare-fun res!202569 () Bool)

(assert (=> b!363406 (=> (not res!202569) (not e!222513))))

(assert (=> b!363406 (= res!202569 (not (validKeyInArray!0 (select (arr!9772 a!4337) i!1478))))))

(assert (= (and start!36306 res!202568) b!363406))

(assert (= (and b!363406 res!202569) b!363407))

(assert (= (and b!363407 res!202567) b!363408))

(assert (= (and b!363408 res!202570) b!363409))

(declare-fun m!360401 () Bool)

(assert (=> start!36306 m!360401))

(declare-fun m!360403 () Bool)

(assert (=> b!363409 m!360403))

(declare-fun m!360405 () Bool)

(assert (=> b!363409 m!360405))

(declare-fun m!360407 () Bool)

(assert (=> b!363409 m!360407))

(declare-fun m!360409 () Bool)

(assert (=> b!363409 m!360409))

(declare-fun m!360411 () Bool)

(assert (=> b!363409 m!360411))

(declare-fun m!360413 () Bool)

(assert (=> b!363409 m!360413))

(declare-fun m!360415 () Bool)

(assert (=> b!363409 m!360415))

(declare-fun m!360417 () Bool)

(assert (=> b!363409 m!360417))

(declare-fun m!360419 () Bool)

(assert (=> b!363409 m!360419))

(declare-fun m!360421 () Bool)

(assert (=> b!363407 m!360421))

(declare-fun m!360423 () Bool)

(assert (=> b!363406 m!360423))

(assert (=> b!363406 m!360423))

(declare-fun m!360425 () Bool)

(assert (=> b!363406 m!360425))

(push 1)

(assert (not b!363409))

(assert (not b!363407))

(assert (not b!363406))

(assert (not start!36306))

(check-sat)

