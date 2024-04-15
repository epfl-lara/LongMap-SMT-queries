; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36290 () Bool)

(assert start!36290)

(declare-fun b!363126 () Bool)

(declare-fun e!222334 () Bool)

(assert (=> b!363126 (= e!222334 (not true))))

(declare-fun lt!167282 () (_ BitVec 32))

(declare-fun lt!167279 () (_ BitVec 32))

(declare-datatypes ((array!20566 0))(
  ( (array!20567 (arr!9762 (Array (_ BitVec 32) (_ BitVec 64))) (size!10115 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20566)

(declare-fun arrayCountValidKeys!0 (array!20566 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363126 (= (bvadd lt!167282 lt!167279) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10115 a!4337)))))

(declare-datatypes ((Unit!11208 0))(
  ( (Unit!11209) )
))
(declare-fun lt!167283 () Unit!11208)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20566 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11208)

(assert (=> b!363126 (= lt!167283 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10115 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167278 () (_ BitVec 32))

(assert (=> b!363126 (= lt!167278 lt!167279)))

(assert (=> b!363126 (= lt!167279 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 a!4337)))))

(declare-fun lt!167284 () array!20566)

(assert (=> b!363126 (= lt!167278 (arrayCountValidKeys!0 lt!167284 (bvadd #b00000000000000000000000000000001 i!1478) (size!10115 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167280 () Unit!11208)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20566 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11208)

(assert (=> b!363126 (= lt!167280 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363126 (= (arrayCountValidKeys!0 lt!167284 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167282))))

(assert (=> b!363126 (= lt!167282 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363126 (= lt!167284 (array!20567 (store (arr!9762 a!4337) i!1478 k!2980) (size!10115 a!4337)))))

(declare-fun lt!167281 () Unit!11208)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20566 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11208)

(assert (=> b!363126 (= lt!167281 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363123 () Bool)

(declare-fun res!202428 () Bool)

(assert (=> b!363123 (=> (not res!202428) (not e!222334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363123 (= res!202428 (not (validKeyInArray!0 (select (arr!9762 a!4337) i!1478))))))

(declare-fun res!202427 () Bool)

(assert (=> start!36290 (=> (not res!202427) (not e!222334))))

(assert (=> start!36290 (= res!202427 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10115 a!4337))))))

(assert (=> start!36290 e!222334))

(assert (=> start!36290 true))

(declare-fun array_inv!7211 (array!20566) Bool)

(assert (=> start!36290 (array_inv!7211 a!4337)))

(declare-fun b!363124 () Bool)

(declare-fun res!202429 () Bool)

(assert (=> b!363124 (=> (not res!202429) (not e!222334))))

(assert (=> b!363124 (= res!202429 (validKeyInArray!0 k!2980))))

(declare-fun b!363125 () Bool)

(declare-fun res!202426 () Bool)

(assert (=> b!363125 (=> (not res!202426) (not e!222334))))

(assert (=> b!363125 (= res!202426 (bvslt (size!10115 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36290 res!202427) b!363123))

(assert (= (and b!363123 res!202428) b!363124))

(assert (= (and b!363124 res!202429) b!363125))

(assert (= (and b!363125 res!202426) b!363126))

(declare-fun m!359651 () Bool)

(assert (=> b!363126 m!359651))

(declare-fun m!359653 () Bool)

(assert (=> b!363126 m!359653))

(declare-fun m!359655 () Bool)

(assert (=> b!363126 m!359655))

(declare-fun m!359657 () Bool)

(assert (=> b!363126 m!359657))

(declare-fun m!359659 () Bool)

(assert (=> b!363126 m!359659))

(declare-fun m!359661 () Bool)

(assert (=> b!363126 m!359661))

(declare-fun m!359663 () Bool)

(assert (=> b!363126 m!359663))

(declare-fun m!359665 () Bool)

(assert (=> b!363126 m!359665))

(declare-fun m!359667 () Bool)

(assert (=> b!363126 m!359667))

(declare-fun m!359669 () Bool)

(assert (=> b!363123 m!359669))

(assert (=> b!363123 m!359669))

(declare-fun m!359671 () Bool)

(assert (=> b!363123 m!359671))

(declare-fun m!359673 () Bool)

(assert (=> start!36290 m!359673))

(declare-fun m!359675 () Bool)

(assert (=> b!363124 m!359675))

(push 1)

(assert (not start!36290))

(assert (not b!363123))

(assert (not b!363124))

(assert (not b!363126))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

