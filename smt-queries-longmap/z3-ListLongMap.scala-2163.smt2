; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36314 () Bool)

(assert start!36314)

(declare-fun b!363459 () Bool)

(declare-fun res!202620 () Bool)

(declare-fun e!222542 () Bool)

(assert (=> b!363459 (=> (not res!202620) (not e!222542))))

(declare-datatypes ((array!20594 0))(
  ( (array!20595 (arr!9776 (Array (_ BitVec 32) (_ BitVec 64))) (size!10128 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20594)

(assert (=> b!363459 (= res!202620 (bvslt (size!10128 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363460 () Bool)

(declare-fun e!222544 () Bool)

(assert (=> b!363460 (= e!222542 (not e!222544))))

(declare-fun res!202623 () Bool)

(assert (=> b!363460 (=> res!202623 e!222544)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363460 (= res!202623 (or (bvslt (size!10128 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167633 () (_ BitVec 32))

(declare-fun lt!167628 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20594 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363460 (= (bvadd lt!167633 lt!167628) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10128 a!4337)))))

(declare-datatypes ((Unit!11240 0))(
  ( (Unit!11241) )
))
(declare-fun lt!167630 () Unit!11240)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11240)

(assert (=> b!363460 (= lt!167630 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10128 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167629 () (_ BitVec 32))

(assert (=> b!363460 (= lt!167629 lt!167628)))

(assert (=> b!363460 (= lt!167628 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10128 a!4337)))))

(declare-fun lt!167632 () array!20594)

(assert (=> b!363460 (= lt!167629 (arrayCountValidKeys!0 lt!167632 (bvadd #b00000000000000000000000000000001 i!1478) (size!10128 a!4337)))))

(declare-fun lt!167634 () Unit!11240)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11240)

(assert (=> b!363460 (= lt!167634 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167635 () (_ BitVec 32))

(assert (=> b!363460 (= lt!167635 (bvadd #b00000000000000000000000000000001 lt!167633))))

(assert (=> b!363460 (= lt!167635 (arrayCountValidKeys!0 lt!167632 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363460 (= lt!167633 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363460 (= lt!167632 (array!20595 (store (arr!9776 a!4337) i!1478 k0!2980) (size!10128 a!4337)))))

(declare-fun lt!167631 () Unit!11240)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20594 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11240)

(assert (=> b!363460 (= lt!167631 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363461 () Bool)

(declare-fun res!202621 () Bool)

(assert (=> b!363461 (=> (not res!202621) (not e!222542))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363461 (= res!202621 (not (validKeyInArray!0 (select (arr!9776 a!4337) i!1478))))))

(declare-fun res!202622 () Bool)

(assert (=> start!36314 (=> (not res!202622) (not e!222542))))

(assert (=> start!36314 (= res!202622 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10128 a!4337))))))

(assert (=> start!36314 e!222542))

(assert (=> start!36314 true))

(declare-fun array_inv!7218 (array!20594) Bool)

(assert (=> start!36314 (array_inv!7218 a!4337)))

(declare-fun b!363462 () Bool)

(assert (=> b!363462 (= e!222544 true)))

(assert (=> b!363462 (= (bvadd lt!167635 lt!167629) (arrayCountValidKeys!0 lt!167632 #b00000000000000000000000000000000 (size!10128 a!4337)))))

(declare-fun lt!167627 () Unit!11240)

(assert (=> b!363462 (= lt!167627 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167632 #b00000000000000000000000000000000 (size!10128 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363463 () Bool)

(declare-fun res!202624 () Bool)

(assert (=> b!363463 (=> (not res!202624) (not e!222542))))

(assert (=> b!363463 (= res!202624 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36314 res!202622) b!363461))

(assert (= (and b!363461 res!202621) b!363463))

(assert (= (and b!363463 res!202624) b!363459))

(assert (= (and b!363459 res!202620) b!363460))

(assert (= (and b!363460 (not res!202623)) b!363462))

(declare-fun m!360509 () Bool)

(assert (=> b!363462 m!360509))

(declare-fun m!360511 () Bool)

(assert (=> b!363462 m!360511))

(declare-fun m!360513 () Bool)

(assert (=> b!363463 m!360513))

(declare-fun m!360515 () Bool)

(assert (=> start!36314 m!360515))

(declare-fun m!360517 () Bool)

(assert (=> b!363461 m!360517))

(assert (=> b!363461 m!360517))

(declare-fun m!360519 () Bool)

(assert (=> b!363461 m!360519))

(declare-fun m!360521 () Bool)

(assert (=> b!363460 m!360521))

(declare-fun m!360523 () Bool)

(assert (=> b!363460 m!360523))

(declare-fun m!360525 () Bool)

(assert (=> b!363460 m!360525))

(declare-fun m!360527 () Bool)

(assert (=> b!363460 m!360527))

(declare-fun m!360529 () Bool)

(assert (=> b!363460 m!360529))

(declare-fun m!360531 () Bool)

(assert (=> b!363460 m!360531))

(declare-fun m!360533 () Bool)

(assert (=> b!363460 m!360533))

(declare-fun m!360535 () Bool)

(assert (=> b!363460 m!360535))

(declare-fun m!360537 () Bool)

(assert (=> b!363460 m!360537))

(check-sat (not b!363462) (not b!363461) (not b!363460) (not start!36314) (not b!363463))
