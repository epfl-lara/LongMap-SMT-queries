; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36280 () Bool)

(assert start!36280)

(declare-fun res!202366 () Bool)

(declare-fun e!222304 () Bool)

(assert (=> start!36280 (=> (not res!202366) (not e!222304))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20556 0))(
  ( (array!20557 (arr!9757 (Array (_ BitVec 32) (_ BitVec 64))) (size!10110 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20556)

(assert (=> start!36280 (= res!202366 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10110 a!4337))))))

(assert (=> start!36280 e!222304))

(assert (=> start!36280 true))

(declare-fun array_inv!7206 (array!20556) Bool)

(assert (=> start!36280 (array_inv!7206 a!4337)))

(declare-fun b!363065 () Bool)

(declare-fun res!202367 () Bool)

(assert (=> b!363065 (=> (not res!202367) (not e!222304))))

(assert (=> b!363065 (= res!202367 (bvslt (size!10110 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363064 () Bool)

(declare-fun res!202369 () Bool)

(assert (=> b!363064 (=> (not res!202369) (not e!222304))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363064 (= res!202369 (validKeyInArray!0 k0!2980))))

(declare-fun b!363066 () Bool)

(assert (=> b!363066 (= e!222304 (not (and (bvsge (size!10110 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167201 () array!20556)

(declare-fun arrayCountValidKeys!0 (array!20556 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363066 (= (arrayCountValidKeys!0 lt!167201 (bvadd #b00000000000000000000000000000001 i!1478) (size!10110 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10110 a!4337)))))

(declare-datatypes ((Unit!11198 0))(
  ( (Unit!11199) )
))
(declare-fun lt!167203 () Unit!11198)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20556 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11198)

(assert (=> b!363066 (= lt!167203 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363066 (= (arrayCountValidKeys!0 lt!167201 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!363066 (= lt!167201 (array!20557 (store (arr!9757 a!4337) i!1478 k0!2980) (size!10110 a!4337)))))

(declare-fun lt!167202 () Unit!11198)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20556 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11198)

(assert (=> b!363066 (= lt!167202 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363063 () Bool)

(declare-fun res!202368 () Bool)

(assert (=> b!363063 (=> (not res!202368) (not e!222304))))

(assert (=> b!363063 (= res!202368 (not (validKeyInArray!0 (select (arr!9757 a!4337) i!1478))))))

(assert (= (and start!36280 res!202366) b!363063))

(assert (= (and b!363063 res!202368) b!363064))

(assert (= (and b!363064 res!202369) b!363065))

(assert (= (and b!363065 res!202367) b!363066))

(declare-fun m!359533 () Bool)

(assert (=> start!36280 m!359533))

(declare-fun m!359535 () Bool)

(assert (=> b!363064 m!359535))

(declare-fun m!359537 () Bool)

(assert (=> b!363066 m!359537))

(declare-fun m!359539 () Bool)

(assert (=> b!363066 m!359539))

(declare-fun m!359541 () Bool)

(assert (=> b!363066 m!359541))

(declare-fun m!359543 () Bool)

(assert (=> b!363066 m!359543))

(declare-fun m!359545 () Bool)

(assert (=> b!363066 m!359545))

(declare-fun m!359547 () Bool)

(assert (=> b!363066 m!359547))

(declare-fun m!359549 () Bool)

(assert (=> b!363066 m!359549))

(declare-fun m!359551 () Bool)

(assert (=> b!363063 m!359551))

(assert (=> b!363063 m!359551))

(declare-fun m!359553 () Bool)

(assert (=> b!363063 m!359553))

(check-sat (not b!363063) (not b!363064) (not start!36280) (not b!363066))
(check-sat)
