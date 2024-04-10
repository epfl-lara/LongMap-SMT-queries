; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36180 () Bool)

(assert start!36180)

(declare-fun b!362729 () Bool)

(declare-fun res!202021 () Bool)

(declare-fun e!222143 () Bool)

(assert (=> b!362729 (=> (not res!202021) (not e!222143))))

(declare-datatypes ((array!20496 0))(
  ( (array!20497 (arr!9730 (Array (_ BitVec 32) (_ BitVec 64))) (size!10082 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20496)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362729 (= res!202021 (not (validKeyInArray!0 (select (arr!9730 a!4337) i!1478))))))

(declare-fun res!202020 () Bool)

(assert (=> start!36180 (=> (not res!202020) (not e!222143))))

(assert (=> start!36180 (= res!202020 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10082 a!4337))))))

(assert (=> start!36180 e!222143))

(assert (=> start!36180 true))

(declare-fun array_inv!7172 (array!20496) Bool)

(assert (=> start!36180 (array_inv!7172 a!4337)))

(declare-fun b!362730 () Bool)

(declare-fun res!202018 () Bool)

(assert (=> b!362730 (=> (not res!202018) (not e!222143))))

(declare-fun k!2980 () (_ BitVec 64))

(assert (=> b!362730 (= res!202018 (validKeyInArray!0 k!2980))))

(declare-fun b!362732 () Bool)

(assert (=> b!362732 (= e!222143 (not true))))

(declare-fun lt!166964 () (_ BitVec 32))

(declare-fun lt!166967 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20496 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362732 (= (bvadd lt!166964 lt!166967) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10082 a!4337)))))

(declare-datatypes ((Unit!11160 0))(
  ( (Unit!11161) )
))
(declare-fun lt!166963 () Unit!11160)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11160)

(assert (=> b!362732 (= lt!166963 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10082 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166966 () (_ BitVec 32))

(assert (=> b!362732 (= lt!166966 lt!166967)))

(assert (=> b!362732 (= lt!166967 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10082 a!4337)))))

(declare-fun lt!166965 () array!20496)

(assert (=> b!362732 (= lt!166966 (arrayCountValidKeys!0 lt!166965 (bvadd #b00000000000000000000000000000001 i!1478) (size!10082 a!4337)))))

(declare-fun lt!166962 () Unit!11160)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11160)

(assert (=> b!362732 (= lt!166962 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362732 (= (arrayCountValidKeys!0 lt!166965 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!166964))))

(assert (=> b!362732 (= lt!166964 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362732 (= lt!166965 (array!20497 (store (arr!9730 a!4337) i!1478 k!2980) (size!10082 a!4337)))))

(declare-fun lt!166961 () Unit!11160)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20496 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11160)

(assert (=> b!362732 (= lt!166961 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362731 () Bool)

(declare-fun res!202019 () Bool)

(assert (=> b!362731 (=> (not res!202019) (not e!222143))))

(assert (=> b!362731 (= res!202019 (bvslt (size!10082 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36180 res!202020) b!362729))

(assert (= (and b!362729 res!202021) b!362730))

(assert (= (and b!362730 res!202018) b!362731))

(assert (= (and b!362731 res!202019) b!362732))

(declare-fun m!359375 () Bool)

(assert (=> b!362729 m!359375))

(assert (=> b!362729 m!359375))

(declare-fun m!359377 () Bool)

(assert (=> b!362729 m!359377))

(declare-fun m!359379 () Bool)

(assert (=> start!36180 m!359379))

(declare-fun m!359381 () Bool)

(assert (=> b!362730 m!359381))

(declare-fun m!359383 () Bool)

(assert (=> b!362732 m!359383))

(declare-fun m!359385 () Bool)

(assert (=> b!362732 m!359385))

(declare-fun m!359387 () Bool)

(assert (=> b!362732 m!359387))

(declare-fun m!359389 () Bool)

(assert (=> b!362732 m!359389))

(declare-fun m!359391 () Bool)

(assert (=> b!362732 m!359391))

(declare-fun m!359393 () Bool)

(assert (=> b!362732 m!359393))

(declare-fun m!359395 () Bool)

(assert (=> b!362732 m!359395))

(declare-fun m!359397 () Bool)

(assert (=> b!362732 m!359397))

(declare-fun m!359399 () Bool)

(assert (=> b!362732 m!359399))

(push 1)

(assert (not b!362730))

(assert (not b!362732))

(assert (not b!362729))

(assert (not start!36180))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

