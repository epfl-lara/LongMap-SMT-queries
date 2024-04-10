; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36190 () Bool)

(assert start!36190)

(declare-fun b!362797 () Bool)

(declare-fun e!222183 () Bool)

(declare-fun e!222182 () Bool)

(assert (=> b!362797 (= e!222183 (not e!222182))))

(declare-fun res!202087 () Bool)

(assert (=> b!362797 (=> res!202087 e!222182)))

(declare-datatypes ((array!20506 0))(
  ( (array!20507 (arr!9735 (Array (_ BitVec 32) (_ BitVec 64))) (size!10087 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20506)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362797 (= res!202087 (or (bvslt (size!10087 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167084 () (_ BitVec 32))

(declare-fun lt!167088 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20506 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362797 (= (bvadd lt!167084 lt!167088) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10087 a!4337)))))

(declare-datatypes ((Unit!11170 0))(
  ( (Unit!11171) )
))
(declare-fun lt!167083 () Unit!11170)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20506 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11170)

(assert (=> b!362797 (= lt!167083 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10087 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167082 () (_ BitVec 32))

(assert (=> b!362797 (= lt!167082 lt!167088)))

(assert (=> b!362797 (= lt!167088 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10087 a!4337)))))

(declare-fun lt!167090 () array!20506)

(assert (=> b!362797 (= lt!167082 (arrayCountValidKeys!0 lt!167090 (bvadd #b00000000000000000000000000000001 i!1478) (size!10087 a!4337)))))

(declare-fun lt!167085 () Unit!11170)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11170)

(assert (=> b!362797 (= lt!167085 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167086 () (_ BitVec 32))

(assert (=> b!362797 (= lt!167086 (bvadd #b00000000000000000000000000000001 lt!167084))))

(assert (=> b!362797 (= lt!167086 (arrayCountValidKeys!0 lt!167090 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362797 (= lt!167084 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362797 (= lt!167090 (array!20507 (store (arr!9735 a!4337) i!1478 k!2980) (size!10087 a!4337)))))

(declare-fun lt!167087 () Unit!11170)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20506 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11170)

(assert (=> b!362797 (= lt!167087 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362798 () Bool)

(declare-fun res!202090 () Bool)

(assert (=> b!362798 (=> (not res!202090) (not e!222183))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362798 (= res!202090 (not (validKeyInArray!0 (select (arr!9735 a!4337) i!1478))))))

(declare-fun b!362799 () Bool)

(declare-fun res!202086 () Bool)

(assert (=> b!362799 (=> (not res!202086) (not e!222183))))

(assert (=> b!362799 (= res!202086 (validKeyInArray!0 k!2980))))

(declare-fun b!362800 () Bool)

(assert (=> b!362800 (= e!222182 true)))

(assert (=> b!362800 (= (bvadd lt!167086 lt!167082) (arrayCountValidKeys!0 lt!167090 #b00000000000000000000000000000000 (size!10087 a!4337)))))

(declare-fun lt!167089 () Unit!11170)

(assert (=> b!362800 (= lt!167089 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167090 #b00000000000000000000000000000000 (size!10087 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202088 () Bool)

(assert (=> start!36190 (=> (not res!202088) (not e!222183))))

(assert (=> start!36190 (= res!202088 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10087 a!4337))))))

(assert (=> start!36190 e!222183))

(assert (=> start!36190 true))

(declare-fun array_inv!7177 (array!20506) Bool)

(assert (=> start!36190 (array_inv!7177 a!4337)))

(declare-fun b!362801 () Bool)

(declare-fun res!202089 () Bool)

(assert (=> b!362801 (=> (not res!202089) (not e!222183))))

(assert (=> b!362801 (= res!202089 (bvslt (size!10087 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36190 res!202088) b!362798))

(assert (= (and b!362798 res!202090) b!362799))

(assert (= (and b!362799 res!202086) b!362801))

(assert (= (and b!362801 res!202089) b!362797))

(assert (= (and b!362797 (not res!202087)) b!362800))

(declare-fun m!359513 () Bool)

(assert (=> b!362798 m!359513))

(assert (=> b!362798 m!359513))

(declare-fun m!359515 () Bool)

(assert (=> b!362798 m!359515))

(declare-fun m!359517 () Bool)

(assert (=> b!362799 m!359517))

(declare-fun m!359519 () Bool)

(assert (=> b!362797 m!359519))

(declare-fun m!359521 () Bool)

(assert (=> b!362797 m!359521))

(declare-fun m!359523 () Bool)

(assert (=> b!362797 m!359523))

(declare-fun m!359525 () Bool)

(assert (=> b!362797 m!359525))

(declare-fun m!359527 () Bool)

(assert (=> b!362797 m!359527))

(declare-fun m!359529 () Bool)

(assert (=> b!362797 m!359529))

(declare-fun m!359531 () Bool)

(assert (=> b!362797 m!359531))

(declare-fun m!359533 () Bool)

(assert (=> b!362797 m!359533))

(declare-fun m!359535 () Bool)

(assert (=> b!362797 m!359535))

(declare-fun m!359537 () Bool)

(assert (=> start!36190 m!359537))

(declare-fun m!359539 () Bool)

(assert (=> b!362800 m!359539))

(declare-fun m!359541 () Bool)

(assert (=> b!362800 m!359541))

(push 1)

(assert (not b!362800))

(assert (not start!36190))

(assert (not b!362798))

(assert (not b!362797))

