; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36322 () Bool)

(assert start!36322)

(declare-fun b!363519 () Bool)

(declare-fun res!202684 () Bool)

(declare-fun e!222578 () Bool)

(assert (=> b!363519 (=> (not res!202684) (not e!222578))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363519 (= res!202684 (validKeyInArray!0 k!2980))))

(declare-fun b!363520 () Bool)

(declare-fun res!202682 () Bool)

(assert (=> b!363520 (=> (not res!202682) (not e!222578))))

(declare-datatypes ((array!20602 0))(
  ( (array!20603 (arr!9780 (Array (_ BitVec 32) (_ BitVec 64))) (size!10132 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20602)

(declare-fun i!1478 () (_ BitVec 32))

(assert (=> b!363520 (= res!202682 (not (validKeyInArray!0 (select (arr!9780 a!4337) i!1478))))))

(declare-fun b!363521 () Bool)

(declare-fun res!202680 () Bool)

(assert (=> b!363521 (=> (not res!202680) (not e!222578))))

(assert (=> b!363521 (= res!202680 (bvslt (size!10132 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363522 () Bool)

(declare-fun e!222580 () Bool)

(declare-fun lt!167753 () (_ BitVec 32))

(declare-fun lt!167752 () (_ BitVec 32))

(assert (=> b!363522 (= e!222580 (= lt!167753 (bvadd #b00000000000000000000000000000001 lt!167752)))))

(declare-fun lt!167755 () (_ BitVec 32))

(declare-fun lt!167751 () (_ BitVec 32))

(assert (=> b!363522 (= (bvadd lt!167755 lt!167751) lt!167753)))

(declare-fun lt!167754 () array!20602)

(declare-fun arrayCountValidKeys!0 (array!20602 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363522 (= lt!167753 (arrayCountValidKeys!0 lt!167754 #b00000000000000000000000000000000 (size!10132 a!4337)))))

(declare-datatypes ((Unit!11248 0))(
  ( (Unit!11249) )
))
(declare-fun lt!167758 () Unit!11248)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11248)

(assert (=> b!363522 (= lt!167758 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167754 #b00000000000000000000000000000000 (size!10132 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202683 () Bool)

(assert (=> start!36322 (=> (not res!202683) (not e!222578))))

(assert (=> start!36322 (= res!202683 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10132 a!4337))))))

(assert (=> start!36322 e!222578))

(assert (=> start!36322 true))

(declare-fun array_inv!7222 (array!20602) Bool)

(assert (=> start!36322 (array_inv!7222 a!4337)))

(declare-fun b!363523 () Bool)

(assert (=> b!363523 (= e!222578 (not e!222580))))

(declare-fun res!202681 () Bool)

(assert (=> b!363523 (=> res!202681 e!222580)))

(assert (=> b!363523 (= res!202681 (or (bvslt (size!10132 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167761 () (_ BitVec 32))

(declare-fun lt!167757 () (_ BitVec 32))

(assert (=> b!363523 (= (bvadd lt!167761 lt!167757) lt!167752)))

(assert (=> b!363523 (= lt!167752 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10132 a!4337)))))

(declare-fun lt!167759 () Unit!11248)

(assert (=> b!363523 (= lt!167759 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10132 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363523 (= lt!167751 lt!167757)))

(assert (=> b!363523 (= lt!167757 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10132 a!4337)))))

(assert (=> b!363523 (= lt!167751 (arrayCountValidKeys!0 lt!167754 (bvadd #b00000000000000000000000000000001 i!1478) (size!10132 a!4337)))))

(declare-fun lt!167760 () Unit!11248)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11248)

(assert (=> b!363523 (= lt!167760 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363523 (= lt!167755 (bvadd #b00000000000000000000000000000001 lt!167761))))

(assert (=> b!363523 (= lt!167755 (arrayCountValidKeys!0 lt!167754 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363523 (= lt!167761 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363523 (= lt!167754 (array!20603 (store (arr!9780 a!4337) i!1478 k!2980) (size!10132 a!4337)))))

(declare-fun lt!167756 () Unit!11248)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20602 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11248)

(assert (=> b!363523 (= lt!167756 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(assert (= (and start!36322 res!202683) b!363520))

(assert (= (and b!363520 res!202682) b!363519))

(assert (= (and b!363519 res!202684) b!363521))

(assert (= (and b!363521 res!202680) b!363523))

(assert (= (and b!363523 (not res!202681)) b!363522))

(declare-fun m!360629 () Bool)

(assert (=> b!363520 m!360629))

(assert (=> b!363520 m!360629))

(declare-fun m!360631 () Bool)

(assert (=> b!363520 m!360631))

(declare-fun m!360633 () Bool)

(assert (=> b!363522 m!360633))

(declare-fun m!360635 () Bool)

(assert (=> b!363522 m!360635))

(declare-fun m!360637 () Bool)

(assert (=> b!363519 m!360637))

(declare-fun m!360639 () Bool)

(assert (=> b!363523 m!360639))

(declare-fun m!360641 () Bool)

(assert (=> b!363523 m!360641))

(declare-fun m!360643 () Bool)

(assert (=> b!363523 m!360643))

(declare-fun m!360645 () Bool)

(assert (=> b!363523 m!360645))

(declare-fun m!360647 () Bool)

(assert (=> b!363523 m!360647))

(declare-fun m!360649 () Bool)

(assert (=> b!363523 m!360649))

(declare-fun m!360651 () Bool)

(assert (=> b!363523 m!360651))

(declare-fun m!360653 () Bool)

(assert (=> b!363523 m!360653))

(declare-fun m!360655 () Bool)

(assert (=> b!363523 m!360655))

(declare-fun m!360657 () Bool)

(assert (=> start!36322 m!360657))

(push 1)

(assert (not b!363523))

(assert (not b!363520))

(assert (not start!36322))

(assert (not b!363522))

(assert (not b!363519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

