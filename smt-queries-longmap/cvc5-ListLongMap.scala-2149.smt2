; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36186 () Bool)

(assert start!36186)

(declare-fun b!362767 () Bool)

(declare-fun res!202060 () Bool)

(declare-fun e!222165 () Bool)

(assert (=> b!362767 (=> (not res!202060) (not e!222165))))

(declare-datatypes ((array!20502 0))(
  ( (array!20503 (arr!9733 (Array (_ BitVec 32) (_ BitVec 64))) (size!10085 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20502)

(assert (=> b!362767 (= res!202060 (bvslt (size!10085 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362768 () Bool)

(declare-fun e!222163 () Bool)

(assert (=> b!362768 (= e!222165 (not e!222163))))

(declare-fun res!202057 () Bool)

(assert (=> b!362768 (=> res!202057 e!222163)))

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362768 (= res!202057 (or (bvslt (size!10085 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167033 () (_ BitVec 32))

(declare-fun lt!167032 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20502 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362768 (= (bvadd lt!167033 lt!167032) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10085 a!4337)))))

(declare-datatypes ((Unit!11166 0))(
  ( (Unit!11167) )
))
(declare-fun lt!167036 () Unit!11166)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11166)

(assert (=> b!362768 (= lt!167036 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10085 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167034 () (_ BitVec 32))

(assert (=> b!362768 (= lt!167034 lt!167032)))

(assert (=> b!362768 (= lt!167032 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10085 a!4337)))))

(declare-fun lt!167031 () array!20502)

(assert (=> b!362768 (= lt!167034 (arrayCountValidKeys!0 lt!167031 (bvadd #b00000000000000000000000000000001 i!1478) (size!10085 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167035 () Unit!11166)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11166)

(assert (=> b!362768 (= lt!167035 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167029 () (_ BitVec 32))

(assert (=> b!362768 (= lt!167029 (bvadd #b00000000000000000000000000000001 lt!167033))))

(assert (=> b!362768 (= lt!167029 (arrayCountValidKeys!0 lt!167031 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362768 (= lt!167033 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362768 (= lt!167031 (array!20503 (store (arr!9733 a!4337) i!1478 k!2980) (size!10085 a!4337)))))

(declare-fun lt!167028 () Unit!11166)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11166)

(assert (=> b!362768 (= lt!167028 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362769 () Bool)

(declare-fun res!202058 () Bool)

(assert (=> b!362769 (=> (not res!202058) (not e!222165))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362769 (= res!202058 (not (validKeyInArray!0 (select (arr!9733 a!4337) i!1478))))))

(declare-fun res!202056 () Bool)

(assert (=> start!36186 (=> (not res!202056) (not e!222165))))

(assert (=> start!36186 (= res!202056 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10085 a!4337))))))

(assert (=> start!36186 e!222165))

(assert (=> start!36186 true))

(declare-fun array_inv!7175 (array!20502) Bool)

(assert (=> start!36186 (array_inv!7175 a!4337)))

(declare-fun b!362770 () Bool)

(declare-fun res!202059 () Bool)

(assert (=> b!362770 (=> (not res!202059) (not e!222165))))

(assert (=> b!362770 (= res!202059 (validKeyInArray!0 k!2980))))

(declare-fun b!362771 () Bool)

(assert (=> b!362771 (= e!222163 true)))

(assert (=> b!362771 (= (bvadd lt!167029 lt!167034) (arrayCountValidKeys!0 lt!167031 #b00000000000000000000000000000000 (size!10085 a!4337)))))

(declare-fun lt!167030 () Unit!11166)

(assert (=> b!362771 (= lt!167030 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167031 #b00000000000000000000000000000000 (size!10085 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (= (and start!36186 res!202056) b!362769))

(assert (= (and b!362769 res!202058) b!362770))

(assert (= (and b!362770 res!202059) b!362767))

(assert (= (and b!362767 res!202060) b!362768))

(assert (= (and b!362768 (not res!202057)) b!362771))

(declare-fun m!359453 () Bool)

(assert (=> b!362769 m!359453))

(assert (=> b!362769 m!359453))

(declare-fun m!359455 () Bool)

(assert (=> b!362769 m!359455))

(declare-fun m!359457 () Bool)

(assert (=> start!36186 m!359457))

(declare-fun m!359459 () Bool)

(assert (=> b!362768 m!359459))

(declare-fun m!359461 () Bool)

(assert (=> b!362768 m!359461))

(declare-fun m!359463 () Bool)

(assert (=> b!362768 m!359463))

(declare-fun m!359465 () Bool)

(assert (=> b!362768 m!359465))

(declare-fun m!359467 () Bool)

(assert (=> b!362768 m!359467))

(declare-fun m!359469 () Bool)

(assert (=> b!362768 m!359469))

(declare-fun m!359471 () Bool)

(assert (=> b!362768 m!359471))

(declare-fun m!359473 () Bool)

(assert (=> b!362768 m!359473))

(declare-fun m!359475 () Bool)

(assert (=> b!362768 m!359475))

(declare-fun m!359477 () Bool)

(assert (=> b!362771 m!359477))

(declare-fun m!359479 () Bool)

(assert (=> b!362771 m!359479))

(declare-fun m!359481 () Bool)

(assert (=> b!362770 m!359481))

(push 1)

(assert (not b!362769))

(assert (not b!362768))

(assert (not b!362771))

(assert (not b!362770))

(assert (not start!36186))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

