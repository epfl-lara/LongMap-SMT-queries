; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36308 () Bool)

(assert start!36308)

(declare-fun res!202581 () Bool)

(declare-fun e!222520 () Bool)

(assert (=> start!36308 (=> (not res!202581) (not e!222520))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20588 0))(
  ( (array!20589 (arr!9773 (Array (_ BitVec 32) (_ BitVec 64))) (size!10125 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20588)

(assert (=> start!36308 (= res!202581 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10125 a!4337))))))

(assert (=> start!36308 e!222520))

(assert (=> start!36308 true))

(declare-fun array_inv!7215 (array!20588) Bool)

(assert (=> start!36308 (array_inv!7215 a!4337)))

(declare-fun b!363419 () Bool)

(declare-fun res!202582 () Bool)

(assert (=> b!363419 (=> (not res!202582) (not e!222520))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363419 (= res!202582 (validKeyInArray!0 k0!2980))))

(declare-fun b!363420 () Bool)

(declare-fun res!202580 () Bool)

(assert (=> b!363420 (=> (not res!202580) (not e!222520))))

(assert (=> b!363420 (= res!202580 (bvslt (size!10125 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363418 () Bool)

(declare-fun res!202579 () Bool)

(assert (=> b!363418 (=> (not res!202579) (not e!222520))))

(assert (=> b!363418 (= res!202579 (not (validKeyInArray!0 (select (arr!9773 a!4337) i!1478))))))

(declare-fun b!363421 () Bool)

(assert (=> b!363421 (= e!222520 (not (and (bvsge (size!10125 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167554 () (_ BitVec 32))

(declare-fun lt!167557 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20588 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363421 (= (bvadd lt!167554 lt!167557) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10125 a!4337)))))

(declare-datatypes ((Unit!11234 0))(
  ( (Unit!11235) )
))
(declare-fun lt!167560 () Unit!11234)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20588 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11234)

(assert (=> b!363421 (= lt!167560 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10125 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167555 () (_ BitVec 32))

(assert (=> b!363421 (= lt!167555 lt!167557)))

(assert (=> b!363421 (= lt!167557 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10125 a!4337)))))

(declare-fun lt!167559 () array!20588)

(assert (=> b!363421 (= lt!167555 (arrayCountValidKeys!0 lt!167559 (bvadd #b00000000000000000000000000000001 i!1478) (size!10125 a!4337)))))

(declare-fun lt!167558 () Unit!11234)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11234)

(assert (=> b!363421 (= lt!167558 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363421 (= (arrayCountValidKeys!0 lt!167559 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167554))))

(assert (=> b!363421 (= lt!167554 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363421 (= lt!167559 (array!20589 (store (arr!9773 a!4337) i!1478 k0!2980) (size!10125 a!4337)))))

(declare-fun lt!167556 () Unit!11234)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11234)

(assert (=> b!363421 (= lt!167556 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36308 res!202581) b!363418))

(assert (= (and b!363418 res!202579) b!363419))

(assert (= (and b!363419 res!202582) b!363420))

(assert (= (and b!363420 res!202580) b!363421))

(declare-fun m!360427 () Bool)

(assert (=> start!36308 m!360427))

(declare-fun m!360429 () Bool)

(assert (=> b!363419 m!360429))

(declare-fun m!360431 () Bool)

(assert (=> b!363418 m!360431))

(assert (=> b!363418 m!360431))

(declare-fun m!360433 () Bool)

(assert (=> b!363418 m!360433))

(declare-fun m!360435 () Bool)

(assert (=> b!363421 m!360435))

(declare-fun m!360437 () Bool)

(assert (=> b!363421 m!360437))

(declare-fun m!360439 () Bool)

(assert (=> b!363421 m!360439))

(declare-fun m!360441 () Bool)

(assert (=> b!363421 m!360441))

(declare-fun m!360443 () Bool)

(assert (=> b!363421 m!360443))

(declare-fun m!360445 () Bool)

(assert (=> b!363421 m!360445))

(declare-fun m!360447 () Bool)

(assert (=> b!363421 m!360447))

(declare-fun m!360449 () Bool)

(assert (=> b!363421 m!360449))

(declare-fun m!360451 () Bool)

(assert (=> b!363421 m!360451))

(check-sat (not b!363421) (not b!363419) (not b!363418) (not start!36308))
(check-sat)
