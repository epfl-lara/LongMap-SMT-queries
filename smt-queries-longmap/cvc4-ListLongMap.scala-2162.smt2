; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36310 () Bool)

(assert start!36310)

(declare-fun b!363431 () Bool)

(declare-fun res!202594 () Bool)

(declare-fun e!222526 () Bool)

(assert (=> b!363431 (=> (not res!202594) (not e!222526))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363431 (= res!202594 (validKeyInArray!0 k!2980))))

(declare-fun b!363432 () Bool)

(declare-fun res!202591 () Bool)

(assert (=> b!363432 (=> (not res!202591) (not e!222526))))

(declare-datatypes ((array!20590 0))(
  ( (array!20591 (arr!9774 (Array (_ BitVec 32) (_ BitVec 64))) (size!10126 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20590)

(assert (=> b!363432 (= res!202591 (bvslt (size!10126 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363430 () Bool)

(declare-fun res!202592 () Bool)

(assert (=> b!363430 (=> (not res!202592) (not e!222526))))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363430 (= res!202592 (not (validKeyInArray!0 (select (arr!9774 a!4337) i!1478))))))

(declare-fun res!202593 () Bool)

(assert (=> start!36310 (=> (not res!202593) (not e!222526))))

(assert (=> start!36310 (= res!202593 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10126 a!4337))))))

(assert (=> start!36310 e!222526))

(assert (=> start!36310 true))

(declare-fun array_inv!7216 (array!20590) Bool)

(assert (=> start!36310 (array_inv!7216 a!4337)))

(declare-fun b!363433 () Bool)

(assert (=> b!363433 (= e!222526 (not (and (bvsge (size!10126 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167577 () (_ BitVec 32))

(declare-fun lt!167579 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20590 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363433 (= (bvadd lt!167577 lt!167579) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10126 a!4337)))))

(declare-datatypes ((Unit!11236 0))(
  ( (Unit!11237) )
))
(declare-fun lt!167578 () Unit!11236)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20590 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11236)

(assert (=> b!363433 (= lt!167578 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10126 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167581 () (_ BitVec 32))

(assert (=> b!363433 (= lt!167581 lt!167579)))

(assert (=> b!363433 (= lt!167579 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10126 a!4337)))))

(declare-fun lt!167575 () array!20590)

(assert (=> b!363433 (= lt!167581 (arrayCountValidKeys!0 lt!167575 (bvadd #b00000000000000000000000000000001 i!1478) (size!10126 a!4337)))))

(declare-fun lt!167580 () Unit!11236)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11236)

(assert (=> b!363433 (= lt!167580 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363433 (= (arrayCountValidKeys!0 lt!167575 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167577))))

(assert (=> b!363433 (= lt!167577 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363433 (= lt!167575 (array!20591 (store (arr!9774 a!4337) i!1478 k!2980) (size!10126 a!4337)))))

(declare-fun lt!167576 () Unit!11236)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20590 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11236)

(assert (=> b!363433 (= lt!167576 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36310 res!202593) b!363430))

(assert (= (and b!363430 res!202592) b!363431))

(assert (= (and b!363431 res!202594) b!363432))

(assert (= (and b!363432 res!202591) b!363433))

(declare-fun m!360453 () Bool)

(assert (=> b!363431 m!360453))

(declare-fun m!360455 () Bool)

(assert (=> b!363430 m!360455))

(assert (=> b!363430 m!360455))

(declare-fun m!360457 () Bool)

(assert (=> b!363430 m!360457))

(declare-fun m!360459 () Bool)

(assert (=> start!36310 m!360459))

(declare-fun m!360461 () Bool)

(assert (=> b!363433 m!360461))

(declare-fun m!360463 () Bool)

(assert (=> b!363433 m!360463))

(declare-fun m!360465 () Bool)

(assert (=> b!363433 m!360465))

(declare-fun m!360467 () Bool)

(assert (=> b!363433 m!360467))

(declare-fun m!360469 () Bool)

(assert (=> b!363433 m!360469))

(declare-fun m!360471 () Bool)

(assert (=> b!363433 m!360471))

(declare-fun m!360473 () Bool)

(assert (=> b!363433 m!360473))

(declare-fun m!360475 () Bool)

(assert (=> b!363433 m!360475))

(declare-fun m!360477 () Bool)

(assert (=> b!363433 m!360477))

(push 1)

(assert (not b!363433))

(assert (not b!363431))

(assert (not start!36310))

(assert (not b!363430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

