; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36170 () Bool)

(assert start!36170)

(declare-fun b!362485 () Bool)

(declare-fun e!221981 () Bool)

(assert (=> b!362485 (= e!221981 (not true))))

(declare-fun lt!166774 () (_ BitVec 32))

(declare-fun lt!166770 () (_ BitVec 32))

(declare-datatypes ((array!20482 0))(
  ( (array!20483 (arr!9723 (Array (_ BitVec 32) (_ BitVec 64))) (size!10076 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20482)

(declare-fun arrayCountValidKeys!0 (array!20482 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362485 (= (bvadd lt!166774 lt!166770) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10076 a!4337)))))

(declare-datatypes ((Unit!11142 0))(
  ( (Unit!11143) )
))
(declare-fun lt!166769 () Unit!11142)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11142)

(assert (=> b!362485 (= lt!166769 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10076 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!166771 () (_ BitVec 32))

(assert (=> b!362485 (= lt!166771 lt!166770)))

(assert (=> b!362485 (= lt!166770 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10076 a!4337)))))

(declare-fun lt!166773 () array!20482)

(assert (=> b!362485 (= lt!166771 (arrayCountValidKeys!0 lt!166773 (bvadd #b00000000000000000000000000000001 i!1478) (size!10076 a!4337)))))

(declare-fun lt!166775 () Unit!11142)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11142)

(assert (=> b!362485 (= lt!166775 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362485 (= (arrayCountValidKeys!0 lt!166773 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!166774))))

(assert (=> b!362485 (= lt!166774 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362485 (= lt!166773 (array!20483 (store (arr!9723 a!4337) i!1478 k!2980) (size!10076 a!4337)))))

(declare-fun lt!166772 () Unit!11142)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11142)

(assert (=> b!362485 (= lt!166772 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!362483 () Bool)

(declare-fun res!201916 () Bool)

(assert (=> b!362483 (=> (not res!201916) (not e!221981))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362483 (= res!201916 (validKeyInArray!0 k!2980))))

(declare-fun b!362484 () Bool)

(declare-fun res!201914 () Bool)

(assert (=> b!362484 (=> (not res!201914) (not e!221981))))

(assert (=> b!362484 (= res!201914 (bvslt (size!10076 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!362482 () Bool)

(declare-fun res!201915 () Bool)

(assert (=> b!362482 (=> (not res!201915) (not e!221981))))

(assert (=> b!362482 (= res!201915 (not (validKeyInArray!0 (select (arr!9723 a!4337) i!1478))))))

(declare-fun res!201913 () Bool)

(assert (=> start!36170 (=> (not res!201913) (not e!221981))))

(assert (=> start!36170 (= res!201913 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10076 a!4337))))))

(assert (=> start!36170 e!221981))

(assert (=> start!36170 true))

(declare-fun array_inv!7172 (array!20482) Bool)

(assert (=> start!36170 (array_inv!7172 a!4337)))

(assert (= (and start!36170 res!201913) b!362482))

(assert (= (and b!362482 res!201915) b!362483))

(assert (= (and b!362483 res!201916) b!362484))

(assert (= (and b!362484 res!201914) b!362485))

(declare-fun m!358703 () Bool)

(assert (=> b!362485 m!358703))

(declare-fun m!358705 () Bool)

(assert (=> b!362485 m!358705))

(declare-fun m!358707 () Bool)

(assert (=> b!362485 m!358707))

(declare-fun m!358709 () Bool)

(assert (=> b!362485 m!358709))

(declare-fun m!358711 () Bool)

(assert (=> b!362485 m!358711))

(declare-fun m!358713 () Bool)

(assert (=> b!362485 m!358713))

(declare-fun m!358715 () Bool)

(assert (=> b!362485 m!358715))

(declare-fun m!358717 () Bool)

(assert (=> b!362485 m!358717))

(declare-fun m!358719 () Bool)

(assert (=> b!362485 m!358719))

(declare-fun m!358721 () Bool)

(assert (=> b!362483 m!358721))

(declare-fun m!358723 () Bool)

(assert (=> b!362482 m!358723))

(assert (=> b!362482 m!358723))

(declare-fun m!358725 () Bool)

(assert (=> b!362482 m!358725))

(declare-fun m!358727 () Bool)

(assert (=> start!36170 m!358727))

(push 1)

(assert (not b!362485))

(assert (not b!362483))

(assert (not b!362482))

(assert (not start!36170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

