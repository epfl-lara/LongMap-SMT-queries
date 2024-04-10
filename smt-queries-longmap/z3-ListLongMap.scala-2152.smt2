; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36206 () Bool)

(assert start!36206)

(declare-fun b!362917 () Bool)

(declare-fun e!222253 () Bool)

(declare-fun e!222254 () Bool)

(assert (=> b!362917 (= e!222253 (not e!222254))))

(declare-fun res!202208 () Bool)

(assert (=> b!362917 (=> res!202208 e!222254)))

(declare-datatypes ((array!20522 0))(
  ( (array!20523 (arr!9743 (Array (_ BitVec 32) (_ BitVec 64))) (size!10095 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20522)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!362917 (= res!202208 (or (bvslt (size!10095 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167300 () (_ BitVec 32))

(declare-fun lt!167303 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20522 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362917 (= (bvadd lt!167300 lt!167303) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10095 a!4337)))))

(declare-datatypes ((Unit!11186 0))(
  ( (Unit!11187) )
))
(declare-fun lt!167304 () Unit!11186)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20522 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11186)

(assert (=> b!362917 (= lt!167304 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10095 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167298 () (_ BitVec 32))

(assert (=> b!362917 (= lt!167298 lt!167303)))

(assert (=> b!362917 (= lt!167303 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10095 a!4337)))))

(declare-fun lt!167299 () array!20522)

(assert (=> b!362917 (= lt!167298 (arrayCountValidKeys!0 lt!167299 (bvadd #b00000000000000000000000000000001 i!1478) (size!10095 a!4337)))))

(declare-fun lt!167302 () Unit!11186)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20522 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11186)

(assert (=> b!362917 (= lt!167302 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167306 () (_ BitVec 32))

(assert (=> b!362917 (= lt!167306 (bvadd #b00000000000000000000000000000001 lt!167300))))

(assert (=> b!362917 (= lt!167306 (arrayCountValidKeys!0 lt!167299 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362917 (= lt!167300 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362917 (= lt!167299 (array!20523 (store (arr!9743 a!4337) i!1478 k0!2980) (size!10095 a!4337)))))

(declare-fun lt!167301 () Unit!11186)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20522 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11186)

(assert (=> b!362917 (= lt!167301 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362918 () Bool)

(declare-fun res!202206 () Bool)

(assert (=> b!362918 (=> (not res!202206) (not e!222253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362918 (= res!202206 (validKeyInArray!0 k0!2980))))

(declare-fun b!362919 () Bool)

(assert (=> b!362919 (= e!222254 true)))

(assert (=> b!362919 (= (bvadd lt!167306 lt!167298) (arrayCountValidKeys!0 lt!167299 #b00000000000000000000000000000000 (size!10095 a!4337)))))

(declare-fun lt!167305 () Unit!11186)

(assert (=> b!362919 (= lt!167305 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167299 #b00000000000000000000000000000000 (size!10095 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362920 () Bool)

(declare-fun res!202209 () Bool)

(assert (=> b!362920 (=> (not res!202209) (not e!222253))))

(assert (=> b!362920 (= res!202209 (bvslt (size!10095 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362921 () Bool)

(declare-fun res!202210 () Bool)

(assert (=> b!362921 (=> (not res!202210) (not e!222253))))

(assert (=> b!362921 (= res!202210 (not (validKeyInArray!0 (select (arr!9743 a!4337) i!1478))))))

(declare-fun res!202207 () Bool)

(assert (=> start!36206 (=> (not res!202207) (not e!222253))))

(assert (=> start!36206 (= res!202207 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10095 a!4337))))))

(assert (=> start!36206 e!222253))

(assert (=> start!36206 true))

(declare-fun array_inv!7185 (array!20522) Bool)

(assert (=> start!36206 (array_inv!7185 a!4337)))

(assert (= (and start!36206 res!202207) b!362921))

(assert (= (and b!362921 res!202210) b!362918))

(assert (= (and b!362918 res!202206) b!362920))

(assert (= (and b!362920 res!202209) b!362917))

(assert (= (and b!362917 (not res!202208)) b!362919))

(declare-fun m!359753 () Bool)

(assert (=> b!362921 m!359753))

(assert (=> b!362921 m!359753))

(declare-fun m!359755 () Bool)

(assert (=> b!362921 m!359755))

(declare-fun m!359757 () Bool)

(assert (=> b!362917 m!359757))

(declare-fun m!359759 () Bool)

(assert (=> b!362917 m!359759))

(declare-fun m!359761 () Bool)

(assert (=> b!362917 m!359761))

(declare-fun m!359763 () Bool)

(assert (=> b!362917 m!359763))

(declare-fun m!359765 () Bool)

(assert (=> b!362917 m!359765))

(declare-fun m!359767 () Bool)

(assert (=> b!362917 m!359767))

(declare-fun m!359769 () Bool)

(assert (=> b!362917 m!359769))

(declare-fun m!359771 () Bool)

(assert (=> b!362917 m!359771))

(declare-fun m!359773 () Bool)

(assert (=> b!362917 m!359773))

(declare-fun m!359775 () Bool)

(assert (=> start!36206 m!359775))

(declare-fun m!359777 () Bool)

(assert (=> b!362918 m!359777))

(declare-fun m!359779 () Bool)

(assert (=> b!362919 m!359779))

(declare-fun m!359781 () Bool)

(assert (=> b!362919 m!359781))

(check-sat (not start!36206) (not b!362918) (not b!362919) (not b!362921) (not b!362917))
