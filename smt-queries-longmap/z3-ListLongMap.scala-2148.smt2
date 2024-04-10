; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36182 () Bool)

(assert start!36182)

(declare-fun b!362742 () Bool)

(declare-fun res!202033 () Bool)

(declare-fun e!222150 () Bool)

(assert (=> b!362742 (=> (not res!202033) (not e!222150))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362742 (= res!202033 (validKeyInArray!0 k0!2980))))

(declare-fun res!202032 () Bool)

(assert (=> start!36182 (=> (not res!202032) (not e!222150))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20498 0))(
  ( (array!20499 (arr!9731 (Array (_ BitVec 32) (_ BitVec 64))) (size!10083 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20498)

(assert (=> start!36182 (= res!202032 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10083 a!4337))))))

(assert (=> start!36182 e!222150))

(assert (=> start!36182 true))

(declare-fun array_inv!7173 (array!20498) Bool)

(assert (=> start!36182 (array_inv!7173 a!4337)))

(declare-fun b!362741 () Bool)

(declare-fun res!202030 () Bool)

(assert (=> b!362741 (=> (not res!202030) (not e!222150))))

(assert (=> b!362741 (= res!202030 (not (validKeyInArray!0 (select (arr!9731 a!4337) i!1478))))))

(declare-fun b!362744 () Bool)

(assert (=> b!362744 (= e!222150 (not true))))

(declare-fun lt!166983 () (_ BitVec 32))

(declare-fun lt!166987 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20498 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362744 (= (bvadd lt!166983 lt!166987) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10083 a!4337)))))

(declare-datatypes ((Unit!11162 0))(
  ( (Unit!11163) )
))
(declare-fun lt!166985 () Unit!11162)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20498 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11162)

(assert (=> b!362744 (= lt!166985 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10083 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166988 () (_ BitVec 32))

(assert (=> b!362744 (= lt!166988 lt!166987)))

(assert (=> b!362744 (= lt!166987 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10083 a!4337)))))

(declare-fun lt!166984 () array!20498)

(assert (=> b!362744 (= lt!166988 (arrayCountValidKeys!0 lt!166984 (bvadd #b00000000000000000000000000000001 i!1478) (size!10083 a!4337)))))

(declare-fun lt!166986 () Unit!11162)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11162)

(assert (=> b!362744 (= lt!166986 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362744 (= (arrayCountValidKeys!0 lt!166984 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!166983))))

(assert (=> b!362744 (= lt!166983 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362744 (= lt!166984 (array!20499 (store (arr!9731 a!4337) i!1478 k0!2980) (size!10083 a!4337)))))

(declare-fun lt!166982 () Unit!11162)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20498 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11162)

(assert (=> b!362744 (= lt!166982 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362743 () Bool)

(declare-fun res!202031 () Bool)

(assert (=> b!362743 (=> (not res!202031) (not e!222150))))

(assert (=> b!362743 (= res!202031 (bvslt (size!10083 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36182 res!202032) b!362741))

(assert (= (and b!362741 res!202030) b!362742))

(assert (= (and b!362742 res!202033) b!362743))

(assert (= (and b!362743 res!202031) b!362744))

(declare-fun m!359401 () Bool)

(assert (=> b!362742 m!359401))

(declare-fun m!359403 () Bool)

(assert (=> start!36182 m!359403))

(declare-fun m!359405 () Bool)

(assert (=> b!362741 m!359405))

(assert (=> b!362741 m!359405))

(declare-fun m!359407 () Bool)

(assert (=> b!362741 m!359407))

(declare-fun m!359409 () Bool)

(assert (=> b!362744 m!359409))

(declare-fun m!359411 () Bool)

(assert (=> b!362744 m!359411))

(declare-fun m!359413 () Bool)

(assert (=> b!362744 m!359413))

(declare-fun m!359415 () Bool)

(assert (=> b!362744 m!359415))

(declare-fun m!359417 () Bool)

(assert (=> b!362744 m!359417))

(declare-fun m!359419 () Bool)

(assert (=> b!362744 m!359419))

(declare-fun m!359421 () Bool)

(assert (=> b!362744 m!359421))

(declare-fun m!359423 () Bool)

(assert (=> b!362744 m!359423))

(declare-fun m!359425 () Bool)

(assert (=> b!362744 m!359425))

(check-sat (not b!362742) (not b!362744) (not b!362741) (not start!36182))
