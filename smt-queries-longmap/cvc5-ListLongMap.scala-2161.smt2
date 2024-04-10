; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36300 () Bool)

(assert start!36300)

(declare-fun res!202534 () Bool)

(declare-fun e!222496 () Bool)

(assert (=> start!36300 (=> (not res!202534) (not e!222496))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20580 0))(
  ( (array!20581 (arr!9769 (Array (_ BitVec 32) (_ BitVec 64))) (size!10121 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20580)

(assert (=> start!36300 (= res!202534 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10121 a!4337))))))

(assert (=> start!36300 e!222496))

(assert (=> start!36300 true))

(declare-fun array_inv!7211 (array!20580) Bool)

(assert (=> start!36300 (array_inv!7211 a!4337)))

(declare-fun b!363372 () Bool)

(declare-fun res!202531 () Bool)

(assert (=> b!363372 (=> (not res!202531) (not e!222496))))

(assert (=> b!363372 (= res!202531 (bvslt (size!10121 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363370 () Bool)

(declare-fun res!202532 () Bool)

(assert (=> b!363370 (=> (not res!202532) (not e!222496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363370 (= res!202532 (not (validKeyInArray!0 (select (arr!9769 a!4337) i!1478))))))

(declare-fun b!363373 () Bool)

(assert (=> b!363373 (= e!222496 (not true))))

(declare-fun lt!167470 () (_ BitVec 32))

(declare-fun lt!167474 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20580 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363373 (= (bvadd lt!167470 lt!167474) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337)))))

(declare-datatypes ((Unit!11226 0))(
  ( (Unit!11227) )
))
(declare-fun lt!167472 () Unit!11226)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20580 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11226)

(assert (=> b!363373 (= lt!167472 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167471 () (_ BitVec 32))

(assert (=> b!363373 (= lt!167471 lt!167474)))

(assert (=> b!363373 (= lt!167474 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(declare-fun lt!167475 () array!20580)

(assert (=> b!363373 (= lt!167471 (arrayCountValidKeys!0 lt!167475 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(declare-fun lt!167476 () Unit!11226)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11226)

(assert (=> b!363373 (= lt!167476 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363373 (= (arrayCountValidKeys!0 lt!167475 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167470))))

(assert (=> b!363373 (= lt!167470 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363373 (= lt!167475 (array!20581 (store (arr!9769 a!4337) i!1478 k!2980) (size!10121 a!4337)))))

(declare-fun lt!167473 () Unit!11226)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11226)

(assert (=> b!363373 (= lt!167473 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363371 () Bool)

(declare-fun res!202533 () Bool)

(assert (=> b!363371 (=> (not res!202533) (not e!222496))))

(assert (=> b!363371 (= res!202533 (validKeyInArray!0 k!2980))))

(assert (= (and start!36300 res!202534) b!363370))

(assert (= (and b!363370 res!202532) b!363371))

(assert (= (and b!363371 res!202533) b!363372))

(assert (= (and b!363372 res!202531) b!363373))

(declare-fun m!360323 () Bool)

(assert (=> start!36300 m!360323))

(declare-fun m!360325 () Bool)

(assert (=> b!363370 m!360325))

(assert (=> b!363370 m!360325))

(declare-fun m!360327 () Bool)

(assert (=> b!363370 m!360327))

(declare-fun m!360329 () Bool)

(assert (=> b!363373 m!360329))

(declare-fun m!360331 () Bool)

(assert (=> b!363373 m!360331))

(declare-fun m!360333 () Bool)

(assert (=> b!363373 m!360333))

(declare-fun m!360335 () Bool)

(assert (=> b!363373 m!360335))

(declare-fun m!360337 () Bool)

(assert (=> b!363373 m!360337))

(declare-fun m!360339 () Bool)

(assert (=> b!363373 m!360339))

(declare-fun m!360341 () Bool)

(assert (=> b!363373 m!360341))

(declare-fun m!360343 () Bool)

(assert (=> b!363373 m!360343))

(declare-fun m!360345 () Bool)

(assert (=> b!363373 m!360345))

(declare-fun m!360347 () Bool)

(assert (=> b!363371 m!360347))

(push 1)

(assert (not b!363371))

(assert (not b!363370))

(assert (not start!36300))

(assert (not b!363373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

