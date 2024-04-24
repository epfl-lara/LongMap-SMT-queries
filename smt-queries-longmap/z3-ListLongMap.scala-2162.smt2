; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36292 () Bool)

(assert start!36292)

(declare-fun res!202564 () Bool)

(declare-fun e!222482 () Bool)

(assert (=> start!36292 (=> (not res!202564) (not e!222482))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20567 0))(
  ( (array!20568 (arr!9762 (Array (_ BitVec 32) (_ BitVec 64))) (size!10114 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20567)

(assert (=> start!36292 (= res!202564 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10114 a!4337))))))

(assert (=> start!36292 e!222482))

(assert (=> start!36292 true))

(declare-fun array_inv!7234 (array!20567) Bool)

(assert (=> start!36292 (array_inv!7234 a!4337)))

(declare-fun b!363357 () Bool)

(declare-fun res!202566 () Bool)

(assert (=> b!363357 (=> (not res!202566) (not e!222482))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363357 (= res!202566 (not (validKeyInArray!0 (select (arr!9762 a!4337) i!1478))))))

(declare-fun b!363360 () Bool)

(assert (=> b!363360 (= e!222482 (not (and (bvsge (size!10114 a!4337) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000))))))

(declare-fun lt!167557 () (_ BitVec 32))

(declare-fun lt!167554 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!20567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363360 (= (bvadd lt!167557 lt!167554) (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10114 a!4337)))))

(declare-datatypes ((Unit!11221 0))(
  ( (Unit!11222) )
))
(declare-fun lt!167552 () Unit!11221)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11221)

(assert (=> b!363360 (= lt!167552 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10114 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167553 () (_ BitVec 32))

(assert (=> b!363360 (= lt!167553 lt!167554)))

(assert (=> b!363360 (= lt!167554 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10114 a!4337)))))

(declare-fun lt!167555 () array!20567)

(assert (=> b!363360 (= lt!167553 (arrayCountValidKeys!0 lt!167555 (bvadd #b00000000000000000000000000000001 i!1478) (size!10114 a!4337)))))

(declare-fun lt!167556 () Unit!11221)

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11221)

(assert (=> b!363360 (= lt!167556 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k0!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363360 (= (arrayCountValidKeys!0 lt!167555 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 lt!167557))))

(assert (=> b!363360 (= lt!167557 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363360 (= lt!167555 (array!20568 (store (arr!9762 a!4337) i!1478 k0!2980) (size!10114 a!4337)))))

(declare-fun lt!167558 () Unit!11221)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20567 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11221)

(assert (=> b!363360 (= lt!167558 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k0!2980 i!1478))))

(declare-fun b!363359 () Bool)

(declare-fun res!202565 () Bool)

(assert (=> b!363359 (=> (not res!202565) (not e!222482))))

(assert (=> b!363359 (= res!202565 (bvslt (size!10114 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363358 () Bool)

(declare-fun res!202567 () Bool)

(assert (=> b!363358 (=> (not res!202567) (not e!222482))))

(assert (=> b!363358 (= res!202567 (validKeyInArray!0 k0!2980))))

(assert (= (and start!36292 res!202564) b!363357))

(assert (= (and b!363357 res!202566) b!363358))

(assert (= (and b!363358 res!202567) b!363359))

(assert (= (and b!363359 res!202565) b!363360))

(declare-fun m!360631 () Bool)

(assert (=> start!36292 m!360631))

(declare-fun m!360633 () Bool)

(assert (=> b!363357 m!360633))

(assert (=> b!363357 m!360633))

(declare-fun m!360635 () Bool)

(assert (=> b!363357 m!360635))

(declare-fun m!360637 () Bool)

(assert (=> b!363360 m!360637))

(declare-fun m!360639 () Bool)

(assert (=> b!363360 m!360639))

(declare-fun m!360641 () Bool)

(assert (=> b!363360 m!360641))

(declare-fun m!360643 () Bool)

(assert (=> b!363360 m!360643))

(declare-fun m!360645 () Bool)

(assert (=> b!363360 m!360645))

(declare-fun m!360647 () Bool)

(assert (=> b!363360 m!360647))

(declare-fun m!360649 () Bool)

(assert (=> b!363360 m!360649))

(declare-fun m!360651 () Bool)

(assert (=> b!363360 m!360651))

(declare-fun m!360653 () Bool)

(assert (=> b!363360 m!360653))

(declare-fun m!360655 () Bool)

(assert (=> b!363358 m!360655))

(check-sat (not b!363360) (not b!363358) (not b!363357) (not start!36292))
(check-sat)
