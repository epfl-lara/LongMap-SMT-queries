; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36176 () Bool)

(assert start!36176)

(declare-fun res!201997 () Bool)

(declare-fun e!222132 () Bool)

(assert (=> start!36176 (=> (not res!201997) (not e!222132))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20492 0))(
  ( (array!20493 (arr!9728 (Array (_ BitVec 32) (_ BitVec 64))) (size!10080 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20492)

(assert (=> start!36176 (= res!201997 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10080 a!4337))))))

(assert (=> start!36176 e!222132))

(assert (=> start!36176 true))

(declare-fun array_inv!7170 (array!20492) Bool)

(assert (=> start!36176 (array_inv!7170 a!4337)))

(declare-fun b!362707 () Bool)

(declare-fun res!201994 () Bool)

(assert (=> b!362707 (=> (not res!201994) (not e!222132))))

(assert (=> b!362707 (= res!201994 (bvslt (size!10080 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362705 () Bool)

(declare-fun res!201995 () Bool)

(assert (=> b!362705 (=> (not res!201995) (not e!222132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362705 (= res!201995 (not (validKeyInArray!0 (select (arr!9728 a!4337) i!1478))))))

(declare-fun b!362708 () Bool)

(assert (=> b!362708 (= e!222132 (not true))))

(declare-fun lt!166937 () array!20492)

(declare-fun arrayCountValidKeys!0 (array!20492 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362708 (= (arrayCountValidKeys!0 lt!166937 (bvadd #b00000000000000000000000000000001 i!1478) (size!10080 a!4337)) (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10080 a!4337)))))

(declare-datatypes ((Unit!11156 0))(
  ( (Unit!11157) )
))
(declare-fun lt!166935 () Unit!11156)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11156)

(assert (=> b!362708 (= lt!166935 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362708 (= (arrayCountValidKeys!0 lt!166937 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478))))))

(assert (=> b!362708 (= lt!166937 (array!20493 (store (arr!9728 a!4337) i!1478 k0!2980) (size!10080 a!4337)))))

(declare-fun lt!166936 () Unit!11156)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20492 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11156)

(assert (=> b!362708 (= lt!166936 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362706 () Bool)

(declare-fun res!201996 () Bool)

(assert (=> b!362706 (=> (not res!201996) (not e!222132))))

(assert (=> b!362706 (= res!201996 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36176 res!201997) b!362705))

(assert (= (and b!362705 res!201995) b!362706))

(assert (= (and b!362706 res!201996) b!362707))

(assert (= (and b!362707 res!201994) b!362708))

(declare-fun m!359331 () Bool)

(assert (=> start!36176 m!359331))

(declare-fun m!359333 () Bool)

(assert (=> b!362705 m!359333))

(assert (=> b!362705 m!359333))

(declare-fun m!359335 () Bool)

(assert (=> b!362705 m!359335))

(declare-fun m!359337 () Bool)

(assert (=> b!362708 m!359337))

(declare-fun m!359339 () Bool)

(assert (=> b!362708 m!359339))

(declare-fun m!359341 () Bool)

(assert (=> b!362708 m!359341))

(declare-fun m!359343 () Bool)

(assert (=> b!362708 m!359343))

(declare-fun m!359345 () Bool)

(assert (=> b!362708 m!359345))

(declare-fun m!359347 () Bool)

(assert (=> b!362708 m!359347))

(declare-fun m!359349 () Bool)

(assert (=> b!362708 m!359349))

(declare-fun m!359351 () Bool)

(assert (=> b!362706 m!359351))

(check-sat (not b!362706) (not start!36176) (not b!362705) (not b!362708))
