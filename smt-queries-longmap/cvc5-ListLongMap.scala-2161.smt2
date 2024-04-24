; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36290 () Bool)

(assert start!36290)

(declare-fun res!202553 () Bool)

(declare-fun e!222476 () Bool)

(assert (=> start!36290 (=> (not res!202553) (not e!222476))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20565 0))(
  ( (array!20566 (arr!9761 (Array (_ BitVec 32) (_ BitVec 64))) (size!10113 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20565)

(assert (=> start!36290 (= res!202553 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10113 a!4337))))))

(assert (=> start!36290 e!222476))

(assert (=> start!36290 true))

(declare-fun array_inv!7233 (array!20565) Bool)

(assert (=> start!36290 (array_inv!7233 a!4337)))

(declare-fun b!363345 () Bool)

(declare-fun res!202555 () Bool)

(assert (=> b!363345 (=> (not res!202555) (not e!222476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363345 (= res!202555 (not (validKeyInArray!0 (select (arr!9761 a!4337) i!1478))))))

(declare-fun b!363348 () Bool)

(assert (=> b!363348 (= e!222476 (not true))))

(declare-fun lt!167532 () (_ BitVec 32))

(declare-fun lt!167536 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363348 (= (bvadd lt!167532 lt!167536) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10113 a!4337)))))

(declare-datatypes ((Unit!11219 0))(
  ( (Unit!11220) )
))
(declare-fun lt!167531 () Unit!11219)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11219)

(assert (=> b!363348 (= lt!167531 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10113 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167537 () (_ BitVec 32))

(assert (=> b!363348 (= lt!167537 lt!167536)))

(assert (=> b!363348 (= lt!167536 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10113 a!4337)))))

(declare-fun lt!167535 () array!20565)

(assert (=> b!363348 (= lt!167537 (arrayCountValidKeys!0 lt!167535 (bvadd #b00000000000000000000000000000001 i!1478) (size!10113 a!4337)))))

(declare-fun lt!167533 () Unit!11219)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11219)

(assert (=> b!363348 (= lt!167533 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363348 (= (arrayCountValidKeys!0 lt!167535 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167532))))

(assert (=> b!363348 (= lt!167532 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363348 (= lt!167535 (array!20566 (store (arr!9761 a!4337) i!1478 k!2980) (size!10113 a!4337)))))

(declare-fun lt!167534 () Unit!11219)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20565 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11219)

(assert (=> b!363348 (= lt!167534 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363347 () Bool)

(declare-fun res!202552 () Bool)

(assert (=> b!363347 (=> (not res!202552) (not e!222476))))

(assert (=> b!363347 (= res!202552 (bvslt (size!10113 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363346 () Bool)

(declare-fun res!202554 () Bool)

(assert (=> b!363346 (=> (not res!202554) (not e!222476))))

(assert (=> b!363346 (= res!202554 (validKeyInArray!0 k!2980))))

(assert (= (and start!36290 res!202553) b!363345))

(assert (= (and b!363345 res!202555) b!363346))

(assert (= (and b!363346 res!202554) b!363347))

(assert (= (and b!363347 res!202552) b!363348))

(declare-fun m!360605 () Bool)

(assert (=> start!36290 m!360605))

(declare-fun m!360607 () Bool)

(assert (=> b!363345 m!360607))

(assert (=> b!363345 m!360607))

(declare-fun m!360609 () Bool)

(assert (=> b!363345 m!360609))

(declare-fun m!360611 () Bool)

(assert (=> b!363348 m!360611))

(declare-fun m!360613 () Bool)

(assert (=> b!363348 m!360613))

(declare-fun m!360615 () Bool)

(assert (=> b!363348 m!360615))

(declare-fun m!360617 () Bool)

(assert (=> b!363348 m!360617))

(declare-fun m!360619 () Bool)

(assert (=> b!363348 m!360619))

(declare-fun m!360621 () Bool)

(assert (=> b!363348 m!360621))

(declare-fun m!360623 () Bool)

(assert (=> b!363348 m!360623))

(declare-fun m!360625 () Bool)

(assert (=> b!363348 m!360625))

(declare-fun m!360627 () Bool)

(assert (=> b!363348 m!360627))

(declare-fun m!360629 () Bool)

(assert (=> b!363346 m!360629))

(push 1)

(assert (not start!36290))

(assert (not b!363345))

(assert (not b!363348))

(assert (not b!363346))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

