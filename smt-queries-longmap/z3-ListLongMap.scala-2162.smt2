; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36292 () Bool)

(assert start!36292)

(declare-fun b!363138 () Bool)

(declare-fun e!222339 () Bool)

(declare-datatypes ((array!20568 0))(
  ( (array!20569 (arr!9763 (Array (_ BitVec 32) (_ BitVec 64))) (size!10116 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20568)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363138 (= e!222339 (not (and (bvsge (size!10116 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167303 () (_ BitVec 32))

(declare-fun lt!167300 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20568 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363138 (= (bvadd lt!167303 lt!167300) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10116 a!4337)))))

(declare-datatypes ((Unit!11210 0))(
  ( (Unit!11211) )
))
(declare-fun lt!167299 () Unit!11210)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20568 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11210)

(assert (=> b!363138 (= lt!167299 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10116 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167302 () (_ BitVec 32))

(assert (=> b!363138 (= lt!167302 lt!167300)))

(assert (=> b!363138 (= lt!167300 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 a!4337)))))

(declare-fun lt!167301 () array!20568)

(assert (=> b!363138 (= lt!167302 (arrayCountValidKeys!0 lt!167301 (bvadd #b00000000000000000000000000000001 i!1478) (size!10116 a!4337)))))

(declare-fun lt!167304 () Unit!11210)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11210)

(assert (=> b!363138 (= lt!167304 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363138 (= (arrayCountValidKeys!0 lt!167301 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167303))))

(assert (=> b!363138 (= lt!167303 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363138 (= lt!167301 (array!20569 (store (arr!9763 a!4337) i!1478 k0!2980) (size!10116 a!4337)))))

(declare-fun lt!167305 () Unit!11210)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20568 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11210)

(assert (=> b!363138 (= lt!167305 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363137 () Bool)

(declare-fun res!202438 () Bool)

(assert (=> b!363137 (=> (not res!202438) (not e!222339))))

(assert (=> b!363137 (= res!202438 (bvslt (size!10116 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202441 () Bool)

(assert (=> start!36292 (=> (not res!202441) (not e!222339))))

(assert (=> start!36292 (= res!202441 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10116 a!4337))))))

(assert (=> start!36292 e!222339))

(assert (=> start!36292 true))

(declare-fun array_inv!7212 (array!20568) Bool)

(assert (=> start!36292 (array_inv!7212 a!4337)))

(declare-fun b!363136 () Bool)

(declare-fun res!202440 () Bool)

(assert (=> b!363136 (=> (not res!202440) (not e!222339))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363136 (= res!202440 (validKeyInArray!0 k0!2980))))

(declare-fun b!363135 () Bool)

(declare-fun res!202439 () Bool)

(assert (=> b!363135 (=> (not res!202439) (not e!222339))))

(assert (=> b!363135 (= res!202439 (not (validKeyInArray!0 (select (arr!9763 a!4337) i!1478))))))

(assert (= (and start!36292 res!202441) b!363135))

(assert (= (and b!363135 res!202439) b!363136))

(assert (= (and b!363136 res!202440) b!363137))

(assert (= (and b!363137 res!202438) b!363138))

(declare-fun m!359677 () Bool)

(assert (=> b!363138 m!359677))

(declare-fun m!359679 () Bool)

(assert (=> b!363138 m!359679))

(declare-fun m!359681 () Bool)

(assert (=> b!363138 m!359681))

(declare-fun m!359683 () Bool)

(assert (=> b!363138 m!359683))

(declare-fun m!359685 () Bool)

(assert (=> b!363138 m!359685))

(declare-fun m!359687 () Bool)

(assert (=> b!363138 m!359687))

(declare-fun m!359689 () Bool)

(assert (=> b!363138 m!359689))

(declare-fun m!359691 () Bool)

(assert (=> b!363138 m!359691))

(declare-fun m!359693 () Bool)

(assert (=> b!363138 m!359693))

(declare-fun m!359695 () Bool)

(assert (=> start!36292 m!359695))

(declare-fun m!359697 () Bool)

(assert (=> b!363136 m!359697))

(declare-fun m!359699 () Bool)

(assert (=> b!363135 m!359699))

(assert (=> b!363135 m!359699))

(declare-fun m!359701 () Bool)

(assert (=> b!363135 m!359701))

(check-sat (not b!363138) (not b!363135) (not start!36292) (not b!363136))
(check-sat)
