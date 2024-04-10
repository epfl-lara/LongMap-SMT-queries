; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36184 () Bool)

(assert start!36184)

(declare-fun res!202042 () Bool)

(declare-fun e!222156 () Bool)

(assert (=> start!36184 (=> (not res!202042) (not e!222156))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20500 0))(
  ( (array!20501 (arr!9732 (Array (_ BitVec 32) (_ BitVec 64))) (size!10084 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20500)

(assert (=> start!36184 (= res!202042 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10084 a!4337))))))

(assert (=> start!36184 e!222156))

(assert (=> start!36184 true))

(declare-fun array_inv!7174 (array!20500) Bool)

(assert (=> start!36184 (array_inv!7174 a!4337)))

(declare-fun b!362755 () Bool)

(declare-fun res!202043 () Bool)

(assert (=> b!362755 (=> (not res!202043) (not e!222156))))

(assert (=> b!362755 (= res!202043 (bvslt (size!10084 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362756 () Bool)

(assert (=> b!362756 (= e!222156 (not true))))

(declare-fun lt!167004 () (_ BitVec 32))

(declare-fun lt!167005 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20500 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362756 (= (bvadd lt!167004 lt!167005) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10084 a!4337)))))

(declare-datatypes ((Unit!11164 0))(
  ( (Unit!11165) )
))
(declare-fun lt!167006 () Unit!11164)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20500 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11164)

(assert (=> b!362756 (= lt!167006 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10084 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167009 () (_ BitVec 32))

(assert (=> b!362756 (= lt!167009 lt!167005)))

(assert (=> b!362756 (= lt!167005 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10084 a!4337)))))

(declare-fun lt!167008 () array!20500)

(assert (=> b!362756 (= lt!167009 (arrayCountValidKeys!0 lt!167008 (bvadd #b00000000000000000000000000000001 i!1478) (size!10084 a!4337)))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lt!167003 () Unit!11164)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11164)

(assert (=> b!362756 (= lt!167003 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362756 (= (arrayCountValidKeys!0 lt!167008 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167004))))

(assert (=> b!362756 (= lt!167004 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362756 (= lt!167008 (array!20501 (store (arr!9732 a!4337) i!1478 k!2980) (size!10084 a!4337)))))

(declare-fun lt!167007 () Unit!11164)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20500 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11164)

(assert (=> b!362756 (= lt!167007 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362754 () Bool)

(declare-fun res!202045 () Bool)

(assert (=> b!362754 (=> (not res!202045) (not e!222156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362754 (= res!202045 (validKeyInArray!0 k!2980))))

(declare-fun b!362753 () Bool)

(declare-fun res!202044 () Bool)

(assert (=> b!362753 (=> (not res!202044) (not e!222156))))

(assert (=> b!362753 (= res!202044 (not (validKeyInArray!0 (select (arr!9732 a!4337) i!1478))))))

(assert (= (and start!36184 res!202042) b!362753))

(assert (= (and b!362753 res!202044) b!362754))

(assert (= (and b!362754 res!202045) b!362755))

(assert (= (and b!362755 res!202043) b!362756))

(declare-fun m!359427 () Bool)

(assert (=> start!36184 m!359427))

(declare-fun m!359429 () Bool)

(assert (=> b!362756 m!359429))

(declare-fun m!359431 () Bool)

(assert (=> b!362756 m!359431))

(declare-fun m!359433 () Bool)

(assert (=> b!362756 m!359433))

(declare-fun m!359435 () Bool)

(assert (=> b!362756 m!359435))

(declare-fun m!359437 () Bool)

(assert (=> b!362756 m!359437))

(declare-fun m!359439 () Bool)

(assert (=> b!362756 m!359439))

(declare-fun m!359441 () Bool)

(assert (=> b!362756 m!359441))

(declare-fun m!359443 () Bool)

(assert (=> b!362756 m!359443))

(declare-fun m!359445 () Bool)

(assert (=> b!362756 m!359445))

(declare-fun m!359447 () Bool)

(assert (=> b!362754 m!359447))

(declare-fun m!359449 () Bool)

(assert (=> b!362753 m!359449))

(assert (=> b!362753 m!359449))

(declare-fun m!359451 () Bool)

(assert (=> b!362753 m!359451))

(push 1)

(assert (not start!36184))

(assert (not b!362753))

(assert (not b!362754))

(assert (not b!362756))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

