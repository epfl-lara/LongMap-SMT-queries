; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36200 () Bool)

(assert start!36200)

(declare-fun b!362872 () Bool)

(declare-fun e!222226 () Bool)

(assert (=> b!362872 (= e!222226 true)))

(declare-fun lt!167220 () (_ BitVec 32))

(declare-datatypes ((array!20516 0))(
  ( (array!20517 (arr!9740 (Array (_ BitVec 32) (_ BitVec 64))) (size!10092 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20516)

(declare-fun lt!167222 () array!20516)

(declare-fun lt!167218 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20516 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362872 (= (bvadd lt!167220 lt!167218) (arrayCountValidKeys!0 lt!167222 #b00000000000000000000000000000000 (size!10092 a!4337)))))

(declare-datatypes ((Unit!11180 0))(
  ( (Unit!11181) )
))
(declare-fun lt!167219 () Unit!11180)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20516 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11180)

(assert (=> b!362872 (= lt!167219 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167222 #b00000000000000000000000000000000 (size!10092 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362873 () Bool)

(declare-fun e!222228 () Bool)

(assert (=> b!362873 (= e!222228 (not e!222226))))

(declare-fun res!202163 () Bool)

(assert (=> b!362873 (=> res!202163 e!222226)))

(assert (=> b!362873 (= res!202163 (or (bvslt (size!10092 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167223 () (_ BitVec 32))

(declare-fun lt!167221 () (_ BitVec 32))

(assert (=> b!362873 (= (bvadd lt!167223 lt!167221) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10092 a!4337)))))

(declare-fun lt!167217 () Unit!11180)

(assert (=> b!362873 (= lt!167217 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10092 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362873 (= lt!167218 lt!167221)))

(assert (=> b!362873 (= lt!167221 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 a!4337)))))

(assert (=> b!362873 (= lt!167218 (arrayCountValidKeys!0 lt!167222 (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 a!4337)))))

(declare-fun lt!167224 () Unit!11180)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11180)

(assert (=> b!362873 (= lt!167224 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362873 (= lt!167220 (bvadd #b00000000000000000000000000000001 lt!167223))))

(assert (=> b!362873 (= lt!167220 (arrayCountValidKeys!0 lt!167222 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362873 (= lt!167223 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!362873 (= lt!167222 (array!20517 (store (arr!9740 a!4337) i!1478 k0!2980) (size!10092 a!4337)))))

(declare-fun lt!167225 () Unit!11180)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20516 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11180)

(assert (=> b!362873 (= lt!167225 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!362874 () Bool)

(declare-fun res!202162 () Bool)

(assert (=> b!362874 (=> (not res!202162) (not e!222228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362874 (= res!202162 (validKeyInArray!0 k0!2980))))

(declare-fun b!362875 () Bool)

(declare-fun res!202161 () Bool)

(assert (=> b!362875 (=> (not res!202161) (not e!222228))))

(assert (=> b!362875 (= res!202161 (not (validKeyInArray!0 (select (arr!9740 a!4337) i!1478))))))

(declare-fun res!202164 () Bool)

(assert (=> start!36200 (=> (not res!202164) (not e!222228))))

(assert (=> start!36200 (= res!202164 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10092 a!4337))))))

(assert (=> start!36200 e!222228))

(assert (=> start!36200 true))

(declare-fun array_inv!7182 (array!20516) Bool)

(assert (=> start!36200 (array_inv!7182 a!4337)))

(declare-fun b!362876 () Bool)

(declare-fun res!202165 () Bool)

(assert (=> b!362876 (=> (not res!202165) (not e!222228))))

(assert (=> b!362876 (= res!202165 (bvslt (size!10092 a!4337) #b01111111111111111111111111111111))))

(assert (= (and start!36200 res!202164) b!362875))

(assert (= (and b!362875 res!202161) b!362874))

(assert (= (and b!362874 res!202162) b!362876))

(assert (= (and b!362876 res!202165) b!362873))

(assert (= (and b!362873 (not res!202163)) b!362872))

(declare-fun m!359663 () Bool)

(assert (=> b!362872 m!359663))

(declare-fun m!359665 () Bool)

(assert (=> b!362872 m!359665))

(declare-fun m!359667 () Bool)

(assert (=> b!362875 m!359667))

(assert (=> b!362875 m!359667))

(declare-fun m!359669 () Bool)

(assert (=> b!362875 m!359669))

(declare-fun m!359671 () Bool)

(assert (=> start!36200 m!359671))

(declare-fun m!359673 () Bool)

(assert (=> b!362874 m!359673))

(declare-fun m!359675 () Bool)

(assert (=> b!362873 m!359675))

(declare-fun m!359677 () Bool)

(assert (=> b!362873 m!359677))

(declare-fun m!359679 () Bool)

(assert (=> b!362873 m!359679))

(declare-fun m!359681 () Bool)

(assert (=> b!362873 m!359681))

(declare-fun m!359683 () Bool)

(assert (=> b!362873 m!359683))

(declare-fun m!359685 () Bool)

(assert (=> b!362873 m!359685))

(declare-fun m!359687 () Bool)

(assert (=> b!362873 m!359687))

(declare-fun m!359689 () Bool)

(assert (=> b!362873 m!359689))

(declare-fun m!359691 () Bool)

(assert (=> b!362873 m!359691))

(check-sat (not start!36200) (not b!362872) (not b!362874) (not b!362873) (not b!362875))
