; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36188 () Bool)

(assert start!36188)

(declare-fun b!362782 () Bool)

(declare-fun res!202071 () Bool)

(declare-fun e!222173 () Bool)

(assert (=> b!362782 (=> (not res!202071) (not e!222173))))

(declare-datatypes ((array!20504 0))(
  ( (array!20505 (arr!9734 (Array (_ BitVec 32) (_ BitVec 64))) (size!10086 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20504)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362782 (= res!202071 (not (validKeyInArray!0 (select (arr!9734 a!4337) i!1478))))))

(declare-fun b!362783 () Bool)

(declare-fun res!202074 () Bool)

(assert (=> b!362783 (=> (not res!202074) (not e!222173))))

(declare-fun k0!2980 () (_ BitVec 64))

(assert (=> b!362783 (= res!202074 (validKeyInArray!0 k0!2980))))

(declare-fun b!362785 () Bool)

(declare-fun e!222174 () Bool)

(assert (=> b!362785 (= e!222174 true)))

(declare-fun lt!167060 () (_ BitVec 32))

(declare-fun lt!167062 () array!20504)

(declare-fun lt!167056 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20504 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362785 (= (bvadd lt!167060 lt!167056) (arrayCountValidKeys!0 lt!167062 #b00000000000000000000000000000000 (size!10086 a!4337)))))

(declare-datatypes ((Unit!11168 0))(
  ( (Unit!11169) )
))
(declare-fun lt!167057 () Unit!11168)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11168)

(assert (=> b!362785 (= lt!167057 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167062 #b00000000000000000000000000000000 (size!10086 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362786 () Bool)

(declare-fun res!202073 () Bool)

(assert (=> b!362786 (=> (not res!202073) (not e!222173))))

(assert (=> b!362786 (= res!202073 (bvslt (size!10086 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202072 () Bool)

(assert (=> start!36188 (=> (not res!202072) (not e!222173))))

(assert (=> start!36188 (= res!202072 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10086 a!4337))))))

(assert (=> start!36188 e!222173))

(assert (=> start!36188 true))

(declare-fun array_inv!7176 (array!20504) Bool)

(assert (=> start!36188 (array_inv!7176 a!4337)))

(declare-fun b!362784 () Bool)

(assert (=> b!362784 (= e!222173 (not e!222174))))

(declare-fun res!202075 () Bool)

(assert (=> b!362784 (=> res!202075 e!222174)))

(assert (=> b!362784 (= res!202075 (or (bvslt (size!10086 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167058 () (_ BitVec 32))

(declare-fun lt!167059 () (_ BitVec 32))

(assert (=> b!362784 (= (bvadd lt!167058 lt!167059) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10086 a!4337)))))

(declare-fun lt!167061 () Unit!11168)

(assert (=> b!362784 (= lt!167061 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10086 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362784 (= lt!167056 lt!167059)))

(assert (=> b!362784 (= lt!167059 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10086 a!4337)))))

(assert (=> b!362784 (= lt!167056 (arrayCountValidKeys!0 lt!167062 (bvadd #b00000000000000000000000000000001 i!1478) (size!10086 a!4337)))))

(declare-fun lt!167055 () Unit!11168)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11168)

(assert (=> b!362784 (= lt!167055 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362784 (= lt!167060 (bvadd #b00000000000000000000000000000001 lt!167058))))

(assert (=> b!362784 (= lt!167060 (arrayCountValidKeys!0 lt!167062 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362784 (= lt!167058 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362784 (= lt!167062 (array!20505 (store (arr!9734 a!4337) i!1478 k0!2980) (size!10086 a!4337)))))

(declare-fun lt!167063 () Unit!11168)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20504 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11168)

(assert (=> b!362784 (= lt!167063 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(assert (= (and start!36188 res!202072) b!362782))

(assert (= (and b!362782 res!202071) b!362783))

(assert (= (and b!362783 res!202074) b!362786))

(assert (= (and b!362786 res!202073) b!362784))

(assert (= (and b!362784 (not res!202075)) b!362785))

(declare-fun m!359483 () Bool)

(assert (=> b!362782 m!359483))

(assert (=> b!362782 m!359483))

(declare-fun m!359485 () Bool)

(assert (=> b!362782 m!359485))

(declare-fun m!359487 () Bool)

(assert (=> b!362784 m!359487))

(declare-fun m!359489 () Bool)

(assert (=> b!362784 m!359489))

(declare-fun m!359491 () Bool)

(assert (=> b!362784 m!359491))

(declare-fun m!359493 () Bool)

(assert (=> b!362784 m!359493))

(declare-fun m!359495 () Bool)

(assert (=> b!362784 m!359495))

(declare-fun m!359497 () Bool)

(assert (=> b!362784 m!359497))

(declare-fun m!359499 () Bool)

(assert (=> b!362784 m!359499))

(declare-fun m!359501 () Bool)

(assert (=> b!362784 m!359501))

(declare-fun m!359503 () Bool)

(assert (=> b!362784 m!359503))

(declare-fun m!359505 () Bool)

(assert (=> b!362783 m!359505))

(declare-fun m!359507 () Bool)

(assert (=> start!36188 m!359507))

(declare-fun m!359509 () Bool)

(assert (=> b!362785 m!359509))

(declare-fun m!359511 () Bool)

(assert (=> b!362785 m!359511))

(check-sat (not start!36188) (not b!362783) (not b!362784) (not b!362782) (not b!362785))
