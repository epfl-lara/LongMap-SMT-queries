; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36318 () Bool)

(assert start!36318)

(declare-fun b!363489 () Bool)

(declare-fun e!222561 () Bool)

(declare-fun e!222560 () Bool)

(assert (=> b!363489 (= e!222561 (not e!222560))))

(declare-fun res!202652 () Bool)

(assert (=> b!363489 (=> res!202652 e!222560)))

(declare-datatypes ((array!20598 0))(
  ( (array!20599 (arr!9778 (Array (_ BitVec 32) (_ BitVec 64))) (size!10130 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20598)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363489 (= res!202652 (or (bvslt (size!10130 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167693 () (_ BitVec 32))

(declare-fun lt!167685 () (_ BitVec 32))

(declare-fun lt!167688 () (_ BitVec 32))

(assert (=> b!363489 (= (bvadd lt!167693 lt!167685) lt!167688)))

(declare-fun arrayCountValidKeys!0 (array!20598 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363489 (= lt!167688 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10130 a!4337)))))

(declare-datatypes ((Unit!11244 0))(
  ( (Unit!11245) )
))
(declare-fun lt!167686 () Unit!11244)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20598 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11244)

(assert (=> b!363489 (= lt!167686 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10130 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167694 () (_ BitVec 32))

(assert (=> b!363489 (= lt!167694 lt!167685)))

(assert (=> b!363489 (= lt!167685 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10130 a!4337)))))

(declare-fun lt!167687 () array!20598)

(assert (=> b!363489 (= lt!167694 (arrayCountValidKeys!0 lt!167687 (bvadd #b00000000000000000000000000000001 i!1478) (size!10130 a!4337)))))

(declare-fun lt!167691 () Unit!11244)

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11244)

(assert (=> b!363489 (= lt!167691 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun lt!167690 () (_ BitVec 32))

(assert (=> b!363489 (= lt!167690 (bvadd #b00000000000000000000000000000001 lt!167693))))

(assert (=> b!363489 (= lt!167690 (arrayCountValidKeys!0 lt!167687 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363489 (= lt!167693 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363489 (= lt!167687 (array!20599 (store (arr!9778 a!4337) i!1478 k!2980) (size!10130 a!4337)))))

(declare-fun lt!167695 () Unit!11244)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20598 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11244)

(assert (=> b!363489 (= lt!167695 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363490 () Bool)

(declare-fun res!202654 () Bool)

(assert (=> b!363490 (=> (not res!202654) (not e!222561))))

(assert (=> b!363490 (= res!202654 (bvslt (size!10130 a!4337) #b01111111111111111111111111111111))))

(declare-fun res!202653 () Bool)

(assert (=> start!36318 (=> (not res!202653) (not e!222561))))

(assert (=> start!36318 (= res!202653 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10130 a!4337))))))

(assert (=> start!36318 e!222561))

(assert (=> start!36318 true))

(declare-fun array_inv!7220 (array!20598) Bool)

(assert (=> start!36318 (array_inv!7220 a!4337)))

(declare-fun b!363491 () Bool)

(declare-fun lt!167692 () (_ BitVec 32))

(assert (=> b!363491 (= e!222560 (= lt!167692 (bvadd #b00000000000000000000000000000001 lt!167688)))))

(assert (=> b!363491 (= (bvadd lt!167690 lt!167694) lt!167692)))

(assert (=> b!363491 (= lt!167692 (arrayCountValidKeys!0 lt!167687 #b00000000000000000000000000000000 (size!10130 a!4337)))))

(declare-fun lt!167689 () Unit!11244)

(assert (=> b!363491 (= lt!167689 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167687 #b00000000000000000000000000000000 (size!10130 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!363492 () Bool)

(declare-fun res!202650 () Bool)

(assert (=> b!363492 (=> (not res!202650) (not e!222561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363492 (= res!202650 (validKeyInArray!0 k!2980))))

(declare-fun b!363493 () Bool)

(declare-fun res!202651 () Bool)

(assert (=> b!363493 (=> (not res!202651) (not e!222561))))

(assert (=> b!363493 (= res!202651 (not (validKeyInArray!0 (select (arr!9778 a!4337) i!1478))))))

(assert (= (and start!36318 res!202653) b!363493))

(assert (= (and b!363493 res!202651) b!363492))

(assert (= (and b!363492 res!202650) b!363490))

(assert (= (and b!363490 res!202654) b!363489))

(assert (= (and b!363489 (not res!202652)) b!363491))

(declare-fun m!360569 () Bool)

(assert (=> b!363489 m!360569))

(declare-fun m!360571 () Bool)

(assert (=> b!363489 m!360571))

(declare-fun m!360573 () Bool)

(assert (=> b!363489 m!360573))

(declare-fun m!360575 () Bool)

(assert (=> b!363489 m!360575))

(declare-fun m!360577 () Bool)

(assert (=> b!363489 m!360577))

(declare-fun m!360579 () Bool)

(assert (=> b!363489 m!360579))

(declare-fun m!360581 () Bool)

(assert (=> b!363489 m!360581))

(declare-fun m!360583 () Bool)

(assert (=> b!363489 m!360583))

(declare-fun m!360585 () Bool)

(assert (=> b!363489 m!360585))

(declare-fun m!360587 () Bool)

(assert (=> start!36318 m!360587))

(declare-fun m!360589 () Bool)

(assert (=> b!363491 m!360589))

(declare-fun m!360591 () Bool)

(assert (=> b!363491 m!360591))

(declare-fun m!360593 () Bool)

(assert (=> b!363492 m!360593))

(declare-fun m!360595 () Bool)

(assert (=> b!363493 m!360595))

(assert (=> b!363493 m!360595))

(declare-fun m!360597 () Bool)

(assert (=> b!363493 m!360597))

(push 1)

(assert (not b!363491))

(assert (not start!36318))

(assert (not b!363493))

(assert (not b!363489))

(assert (not b!363492))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

