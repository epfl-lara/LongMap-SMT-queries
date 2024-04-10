; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36302 () Bool)

(assert start!36302)

(declare-fun b!363383 () Bool)

(declare-fun res!202546 () Bool)

(declare-fun e!222502 () Bool)

(assert (=> b!363383 (=> (not res!202546) (not e!222502))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363383 (= res!202546 (validKeyInArray!0 k0!2980))))

(declare-fun res!202543 () Bool)

(assert (=> start!36302 (=> (not res!202543) (not e!222502))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20582 0))(
  ( (array!20583 (arr!9770 (Array (_ BitVec 32) (_ BitVec 64))) (size!10122 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20582)

(assert (=> start!36302 (= res!202543 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10122 a!4337))))))

(assert (=> start!36302 e!222502))

(assert (=> start!36302 true))

(declare-fun array_inv!7212 (array!20582) Bool)

(assert (=> start!36302 (array_inv!7212 a!4337)))

(declare-fun b!363384 () Bool)

(declare-fun res!202545 () Bool)

(assert (=> b!363384 (=> (not res!202545) (not e!222502))))

(assert (=> b!363384 (= res!202545 (bvslt (size!10122 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363382 () Bool)

(declare-fun res!202544 () Bool)

(assert (=> b!363382 (=> (not res!202544) (not e!222502))))

(assert (=> b!363382 (= res!202544 (not (validKeyInArray!0 (select (arr!9770 a!4337) i!1478))))))

(declare-fun b!363385 () Bool)

(assert (=> b!363385 (= e!222502 (not true))))

(declare-fun lt!167493 () (_ BitVec 32))

(declare-fun lt!167497 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20582 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363385 (= (bvadd lt!167493 lt!167497) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10122 a!4337)))))

(declare-datatypes ((Unit!11228 0))(
  ( (Unit!11229) )
))
(declare-fun lt!167496 () Unit!11228)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11228)

(assert (=> b!363385 (= lt!167496 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10122 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167491 () (_ BitVec 32))

(assert (=> b!363385 (= lt!167491 lt!167497)))

(assert (=> b!363385 (= lt!167497 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10122 a!4337)))))

(declare-fun lt!167495 () array!20582)

(assert (=> b!363385 (= lt!167491 (arrayCountValidKeys!0 lt!167495 (bvadd #b00000000000000000000000000000001 i!1478) (size!10122 a!4337)))))

(declare-fun lt!167492 () Unit!11228)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11228)

(assert (=> b!363385 (= lt!167492 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363385 (= (arrayCountValidKeys!0 lt!167495 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167493))))

(assert (=> b!363385 (= lt!167493 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363385 (= lt!167495 (array!20583 (store (arr!9770 a!4337) i!1478 k0!2980) (size!10122 a!4337)))))

(declare-fun lt!167494 () Unit!11228)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20582 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11228)

(assert (=> b!363385 (= lt!167494 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36302 res!202543) b!363382))

(assert (= (and b!363382 res!202544) b!363383))

(assert (= (and b!363383 res!202546) b!363384))

(assert (= (and b!363384 res!202545) b!363385))

(declare-fun m!360349 () Bool)

(assert (=> b!363383 m!360349))

(declare-fun m!360351 () Bool)

(assert (=> start!36302 m!360351))

(declare-fun m!360353 () Bool)

(assert (=> b!363382 m!360353))

(assert (=> b!363382 m!360353))

(declare-fun m!360355 () Bool)

(assert (=> b!363382 m!360355))

(declare-fun m!360357 () Bool)

(assert (=> b!363385 m!360357))

(declare-fun m!360359 () Bool)

(assert (=> b!363385 m!360359))

(declare-fun m!360361 () Bool)

(assert (=> b!363385 m!360361))

(declare-fun m!360363 () Bool)

(assert (=> b!363385 m!360363))

(declare-fun m!360365 () Bool)

(assert (=> b!363385 m!360365))

(declare-fun m!360367 () Bool)

(assert (=> b!363385 m!360367))

(declare-fun m!360369 () Bool)

(assert (=> b!363385 m!360369))

(declare-fun m!360371 () Bool)

(assert (=> b!363385 m!360371))

(declare-fun m!360373 () Bool)

(assert (=> b!363385 m!360373))

(check-sat (not b!363383) (not b!363382) (not start!36302) (not b!363385))
