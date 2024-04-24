; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36170 () Bool)

(assert start!36170)

(declare-fun res!202041 () Bool)

(declare-fun e!222123 () Bool)

(assert (=> start!36170 (=> (not res!202041) (not e!222123))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20481 0))(
  ( (array!20482 (arr!9722 (Array (_ BitVec 32) (_ BitVec 64))) (size!10074 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20481)

(assert (=> start!36170 (= res!202041 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10074 a!4337))))))

(assert (=> start!36170 e!222123))

(assert (=> start!36170 true))

(declare-fun array_inv!7194 (array!20481) Bool)

(assert (=> start!36170 (array_inv!7194 a!4337)))

(declare-fun b!362705 () Bool)

(declare-fun res!202039 () Bool)

(assert (=> b!362705 (=> (not res!202039) (not e!222123))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362705 (= res!202039 (validKeyInArray!0 k!2980))))

(declare-fun b!362704 () Bool)

(declare-fun res!202040 () Bool)

(assert (=> b!362704 (=> (not res!202040) (not e!222123))))

(assert (=> b!362704 (= res!202040 (not (validKeyInArray!0 (select (arr!9722 a!4337) i!1478))))))

(declare-fun b!362706 () Bool)

(declare-fun res!202042 () Bool)

(assert (=> b!362706 (=> (not res!202042) (not e!222123))))

(assert (=> b!362706 (= res!202042 (bvslt (size!10074 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362707 () Bool)

(assert (=> b!362707 (= e!222123 (not true))))

(declare-fun lt!167022 () (_ BitVec 32))

(declare-fun lt!167023 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20481 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362707 (= (bvadd lt!167022 lt!167023) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10074 a!4337)))))

(declare-datatypes ((Unit!11153 0))(
  ( (Unit!11154) )
))
(declare-fun lt!167028 () Unit!11153)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11153)

(assert (=> b!362707 (= lt!167028 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10074 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167027 () (_ BitVec 32))

(assert (=> b!362707 (= lt!167027 lt!167023)))

(assert (=> b!362707 (= lt!167023 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10074 a!4337)))))

(declare-fun lt!167024 () array!20481)

(assert (=> b!362707 (= lt!167027 (arrayCountValidKeys!0 lt!167024 (bvadd #b00000000000000000000000000000001 i!1478) (size!10074 a!4337)))))

(declare-fun lt!167025 () Unit!11153)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11153)

(assert (=> b!362707 (= lt!167025 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362707 (= (arrayCountValidKeys!0 lt!167024 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167022))))

(assert (=> b!362707 (= lt!167022 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362707 (= lt!167024 (array!20482 (store (arr!9722 a!4337) i!1478 k!2980) (size!10074 a!4337)))))

(declare-fun lt!167026 () Unit!11153)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11153)

(assert (=> b!362707 (= lt!167026 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36170 res!202041) b!362704))

(assert (= (and b!362704 res!202040) b!362705))

(assert (= (and b!362705 res!202039) b!362706))

(assert (= (and b!362706 res!202042) b!362707))

(declare-fun m!359657 () Bool)

(assert (=> start!36170 m!359657))

(declare-fun m!359659 () Bool)

(assert (=> b!362705 m!359659))

(declare-fun m!359661 () Bool)

(assert (=> b!362704 m!359661))

(assert (=> b!362704 m!359661))

(declare-fun m!359663 () Bool)

(assert (=> b!362704 m!359663))

(declare-fun m!359665 () Bool)

(assert (=> b!362707 m!359665))

(declare-fun m!359667 () Bool)

(assert (=> b!362707 m!359667))

(declare-fun m!359669 () Bool)

(assert (=> b!362707 m!359669))

(declare-fun m!359671 () Bool)

(assert (=> b!362707 m!359671))

(declare-fun m!359673 () Bool)

(assert (=> b!362707 m!359673))

(declare-fun m!359675 () Bool)

(assert (=> b!362707 m!359675))

(declare-fun m!359677 () Bool)

(assert (=> b!362707 m!359677))

(declare-fun m!359679 () Bool)

(assert (=> b!362707 m!359679))

(declare-fun m!359681 () Bool)

(assert (=> b!362707 m!359681))

(push 1)

(assert (not b!362705))

(assert (not b!362704))

(assert (not start!36170))

(assert (not b!362707))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

