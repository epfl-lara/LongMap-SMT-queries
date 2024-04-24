; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36306 () Bool)

(assert start!36306)

(declare-fun b!363455 () Bool)

(declare-fun e!222538 () Bool)

(declare-fun lt!167742 () (_ BitVec 32))

(declare-fun lt!167738 () (_ BitVec 32))

(assert (=> b!363455 (= e!222538 (= lt!167742 (bvadd #b00000000000000000000000000000001 lt!167738)))))

(declare-fun lt!167743 () (_ BitVec 32))

(declare-fun lt!167737 () (_ BitVec 32))

(assert (=> b!363455 (= (bvadd lt!167743 lt!167737) lt!167742)))

(declare-datatypes ((array!20581 0))(
  ( (array!20582 (arr!9769 (Array (_ BitVec 32) (_ BitVec 64))) (size!10121 (_ BitVec 32))) )
))
(declare-fun lt!167744 () array!20581)

(declare-fun a!4337 () array!20581)

(declare-fun arrayCountValidKeys!0 (array!20581 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!363455 (= lt!167742 (arrayCountValidKeys!0 lt!167744 #b00000000000000000000000000000000 (size!10121 a!4337)))))

(declare-datatypes ((Unit!11235 0))(
  ( (Unit!11236) )
))
(declare-fun lt!167739 () Unit!11235)

(declare-fun i!1478 () (_ BitVec 32))

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!20581 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11235)

(assert (=> b!363455 (= lt!167739 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!167744 #b00000000000000000000000000000000 (size!10121 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun res!202662 () Bool)

(declare-fun e!222539 () Bool)

(assert (=> start!36306 (=> (not res!202662) (not e!222539))))

(assert (=> start!36306 (= res!202662 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10121 a!4337))))))

(assert (=> start!36306 e!222539))

(assert (=> start!36306 true))

(declare-fun array_inv!7241 (array!20581) Bool)

(assert (=> start!36306 (array_inv!7241 a!4337)))

(declare-fun b!363456 () Bool)

(declare-fun res!202664 () Bool)

(assert (=> b!363456 (=> (not res!202664) (not e!222539))))

(declare-fun k!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!363456 (= res!202664 (validKeyInArray!0 k!2980))))

(declare-fun b!363457 () Bool)

(assert (=> b!363457 (= e!222539 (not e!222538))))

(declare-fun res!202665 () Bool)

(assert (=> b!363457 (=> res!202665 e!222538)))

(assert (=> b!363457 (= res!202665 (or (bvslt (size!10121 a!4337) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 i!1478) #b00000000000000000000000000000000)))))

(declare-fun lt!167745 () (_ BitVec 32))

(declare-fun lt!167740 () (_ BitVec 32))

(assert (=> b!363457 (= (bvadd lt!167745 lt!167740) lt!167738)))

(assert (=> b!363457 (= lt!167738 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337)))))

(declare-fun lt!167747 () Unit!11235)

(assert (=> b!363457 (= lt!167747 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4337 #b00000000000000000000000000000000 (size!10121 a!4337) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363457 (= lt!167737 lt!167740)))

(assert (=> b!363457 (= lt!167740 (arrayCountValidKeys!0 a!4337 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(assert (=> b!363457 (= lt!167737 (arrayCountValidKeys!0 lt!167744 (bvadd #b00000000000000000000000000000001 i!1478) (size!10121 a!4337)))))

(declare-fun lt!167741 () Unit!11235)

(declare-fun lemmaAddValidKeyAndNumKeysToImpliesToALength!0 (array!20581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11235)

(assert (=> b!363457 (= lt!167741 (lemmaAddValidKeyAndNumKeysToImpliesToALength!0 a!4337 i!1478 k!2980 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363457 (= lt!167743 (bvadd #b00000000000000000000000000000001 lt!167745))))

(assert (=> b!363457 (= lt!167743 (arrayCountValidKeys!0 lt!167744 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363457 (= lt!167745 (arrayCountValidKeys!0 a!4337 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> b!363457 (= lt!167744 (array!20582 (store (arr!9769 a!4337) i!1478 k!2980) (size!10121 a!4337)))))

(declare-fun lt!167746 () Unit!11235)

(declare-fun lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 (array!20581 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!11235)

(assert (=> b!363457 (= lt!167746 (lemmaAddValidKeyAndNumKeysFromImpliesFromZero!0 a!4337 i!1478 k!2980 i!1478))))

(declare-fun b!363458 () Bool)

(declare-fun res!202663 () Bool)

(assert (=> b!363458 (=> (not res!202663) (not e!222539))))

(assert (=> b!363458 (= res!202663 (bvslt (size!10121 a!4337) #b01111111111111111111111111111111))))

(declare-fun b!363459 () Bool)

(declare-fun res!202666 () Bool)

(assert (=> b!363459 (=> (not res!202666) (not e!222539))))

(assert (=> b!363459 (= res!202666 (not (validKeyInArray!0 (select (arr!9769 a!4337) i!1478))))))

(assert (= (and start!36306 res!202662) b!363459))

(assert (= (and b!363459 res!202666) b!363456))

(assert (= (and b!363456 res!202664) b!363458))

(assert (= (and b!363458 res!202663) b!363457))

(assert (= (and b!363457 (not res!202665)) b!363455))

(declare-fun m!360829 () Bool)

(assert (=> b!363459 m!360829))

(assert (=> b!363459 m!360829))

(declare-fun m!360831 () Bool)

(assert (=> b!363459 m!360831))

(declare-fun m!360833 () Bool)

(assert (=> b!363455 m!360833))

(declare-fun m!360835 () Bool)

(assert (=> b!363455 m!360835))

(declare-fun m!360837 () Bool)

(assert (=> start!36306 m!360837))

(declare-fun m!360839 () Bool)

(assert (=> b!363456 m!360839))

(declare-fun m!360841 () Bool)

(assert (=> b!363457 m!360841))

(declare-fun m!360843 () Bool)

(assert (=> b!363457 m!360843))

(declare-fun m!360845 () Bool)

(assert (=> b!363457 m!360845))

(declare-fun m!360847 () Bool)

(assert (=> b!363457 m!360847))

(declare-fun m!360849 () Bool)

(assert (=> b!363457 m!360849))

(declare-fun m!360851 () Bool)

(assert (=> b!363457 m!360851))

(declare-fun m!360853 () Bool)

(assert (=> b!363457 m!360853))

(declare-fun m!360855 () Bool)

(assert (=> b!363457 m!360855))

(declare-fun m!360857 () Bool)

(assert (=> b!363457 m!360857))

(push 1)

(assert (not b!363457))

(assert (not b!363459))

(assert (not b!363455))

(assert (not start!36306))

(assert (not b!363456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

